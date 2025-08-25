local XWebSocketMod = GameMain:GetMod("XWebSocket")
XWebSocketMod.IsEnter = false  -- 是否进入状态
XWebSocketMod.OnTip = false    -- 提示状态

--[[
初始化前回调函数
@param mod 模块实例
]]
function XWebSocketMod.OnBeforeInit(_mod)
  print("XWebSocket OnBeforeInit")
  XWebSocketMod.Datas = {}      -- 数据存储数组
  XWebSocketMod.Others = {}     -- 其他信息存储数组
  XWebSocketMod.check = 0       -- 检查标志1
  XWebSocketMod.check2 = 0      -- 检查标志2
  if pcall(CS.CaiXiaChat.Client) then
    XWebSocketMod.ws = CS.CaiXiaChat.Client.Instance.ws  -- WebSocket实例
  end
end

--[[
渲染回调函数
@param deltaTime 时间增量
]]
function XWebSocketMod.OnRender(_deltaTime)
  -- 渲染逻辑（暂无具体实现）
end

--[[
连接WebSocket服务器
@param mod 模块实例
@param url 服务器URL
@param port 端口号
@param protocol 协议类型
@param subprotocol 子协议
]]
function XWebSocketMod.Connect(_mod, url, port, protocol, subprotocol)
--   CS.CaiXiaChat.Client.Instance.ws = nil  -- 清空WebSocket实例
  if CaiXiaChatMiniGame2048.SessionID then
--     CaiXiaChatMiniGame2048.SessionID = nil  -- 清空游戏会话ID
  end
  CS.CaiXiaChat.Client.Instance:Connect(url, port, protocol, subprotocol)  -- 执行连接
end

--[[
断开WebSocket连接
@param mod 模块实例
]]
function XWebSocketMod.Disconnect(_mod)
  if XWebSocketMod.ws then
    CaiXiaChat:ChangeServerStatus(true)  -- 更改服务器状态
    CaiXiaChatWindow:UpdateChatText("系统", "[color=#C00000]已与服务器断开连接！[/color]")  -- 更新聊天文本
    CaiXiaChat:ClearList()  -- 清空列表
    -- 根据WebSocket状态显示不同提示
    if XWebSocketMod.ws.ReadyState == CS.WebSocketSharp.WebSocketState.Connecting then
      CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "正在连接服务器中...\n请稍等！")
    elseif XWebSocketMod.ws.ReadyState == CS.WebSocketSharp.WebSocketState.Closing then
      CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "正在断开连接中...\n请稍等！")
    elseif XWebSocketMod.ws.ReadyState == CS.WebSocketSharp.WebSocketState.Open then
      CS.CaiXiaChat.Client.Instance:DisConnect()  -- 执行断开连接
    end
  end
end

--[[
WebSocket消息处理函数
@param mod 模块实例
@param messageEvent 消息事件对象
]]
function XWebSocketMod.OnMessage(mod, messageEvent)
  if messageEvent.IsPing then
    -- Ping消息处理（心跳包，无需处理）
    return
  end
  
  if messageEvent.IsBinary then
    -- 二进制消息处理
    XWebSocketMod.Check = 1
    local unzippedData = CS.SevenZip.SevenZipHelper.Unzip(messageEvent.RawData)  -- 解压数据
    if unzippedData ~= nil then
      table.insert(XWebSocketMod.Datas, unzippedData)  -- 存储解压后的数据
    end
    XWebSocketMod.Check = 0
  else
    -- 文本消息处理
    XWebSocketMod.Check = 1
    table.insert(XWebSocketMod.Datas, messageEvent.Data)  -- 存储文本数据
    XWebSocketMod.Check = 0
  end
end

--[[
WebSocket连接打开回调函数
]]
function XWebSocketMod.OnOpen()
  -- WebSocket打开回调（暂无具体实现）
end

--[[
WebSocket连接关闭回调函数
@param mod 模块实例
@param closeEvent 关闭事件对象
]]
function XWebSocketMod.OnClose(mod, closeEvent)
  table.insert(XWebSocketMod.Ot_hers, "OnClose:" .. closeEvent.Reason)  -- 记录关闭原因
end

--[[
WebSocket错误回调函数
@param mod 模块实例
@param errorEvent 错误事件对象
]]
function XWebSocketMod.OnError(mod, errorEvent)
  table.insert(XWebSocketMod.Ot_hers, "OnError:" .. errorEvent.Message)  -- 记录错误信息
end

--[[
离开回调函数
@param mod 模块实例
]]
function XWebSocketMod.OnLeave(mod)
  -- 离开回调（暂无具体实现）_
end
