-- CaiXiaChat设置窗口模块
local Windows = GameMain:GetMod("Windows")
CaiXiaChatSettingWindow = Windows:CreateWindow("CaiXiaChatSettingWindow")
local XWebSocket = GameMain:GetMod("XWebSocket")
local socket = require("socket")
local CaiXiaSister = GameMain:GetMod("CaiXiaSister")

-- 服务器配置常量
local DefaultServerHost = "s5.v100.vip"
local DefaultServerPort = "37667"

-- 初始化聊天设置窗口
function CaiXiaChatSettingWindow.OnInit()
    CaiXiaChatSettingWindow.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatSettingWindow")
    
    -- 初始化UI组件
    CaiXiaChatSettingWindow:initUIComponents()
    
    -- 设置事件监听器
    CaiXiaChatSettingWindow:setupEventListeners()
    
    -- 加载用户设置
    CaiXiaChatSettingWindow:loadUserSettings()
    
    Windows:Center()
end

-- 初始化UI组件
function CaiXiaChatSettingWindow:initUIComponents()
    -- 窗口标题
    self:GetChild("frame"):GetChild("title").text = "万界修真群 v" .. CaiXiaChat.Version
    
    -- UI组件引用
    self.window.closeButton = self:GetChild("frame"):GetChild("n6")
    self.UserName = self:GetChild("n2"):GetChild("title")
    self.PassWord = self:GetChild("n10"):GetChild("title")
    self.AutoStart = self:GetChild("n17").asButton
    self.AutoLogin = self:GetChild("n16").asButton
    self.Servers = self:GetChild("n3")
end

-- 设置事件监听器
function CaiXiaChatSettingWindow:setupEventListeners()
    -- 登录按钮
    self:GetChild("n5").onClick:Add(function(sender)
        CaiXiaSister.autoselfConnectServer(sender)
    end)
    
    -- 登出按钮
    self:GetChild("n6").onClick:Add(function(sender)
        self:DisconnectServer(sender)
    end)
    
    -- 用户名键盘事件
    self.UserName.onKeyDown:Add(self.onUserNameKeyDown)
    
    -- 密码提交事件
    self.PassWord.onSubmit:Add(self.onPassWordSubmit)
    
    -- 服务器选择事件
    self.Servers.onChanged:Add(self.onServersSelected)
end

-- 加载用户设置
function CaiXiaChatSettingWindow:loadUserSettings()
    self.UserName.text = CaiXiaChat.UserName
    self.PassWord.text = CaiXiaChat.PassWord
    self.AutoStart.selected = CaiXiaChat.AutoStart
    self.AutoLogin.selected = CaiXiaChat.AutoLogin
end
-- 处理用户名输入框的键盘事件
function CaiXiaChatSettingWindow.onUserNameKeyDown(keyEvent)
    local senderParentName = keyEvent.sender.parent.name
    local character = keyEvent.inputEvent.character
    
    if senderParentName == "n2" and (character == 9 or character == 10) then
        if string.find(CaiXiaChatSettingWindow.UserName.text, "\t") then
            CaiXiaChatSettingWindow.UserName.text = string.gsub(CaiXiaChatSettingWindow.UserName.text, "\t", "")
        end
        CaiXiaChatSettingWindow.PassWord.caretPosition = string.len(CaiXiaChatSettingWindow.PassWord.text)
    end
end

-- 处理密码输入框的提交事件
function CaiXiaChatSettingWindow.onPassWordSubmit(submitEvent)
    CaiXiaChatSettingWindow.WsConnectServer()
end

-- 处理窗口隐藏事件
function CaiXiaChatSettingWindow.OnHide(window)
    CaiXiaChatWindow:Show()
    CaiXiaChatSettingWindow.isShowing = false
end

-- 字符串分割函数
function string.split(text, delimiter)
    local result = {}
    string.gsub(text, "[^" .. delimiter .. "]+", function(match)
        table.insert(result, match)
    end)
    return result
end

-- 处理服务器选择事件
function CaiXiaChatSettingWindow.onServersSelected(selectedItem)
    local serverDict = CS.System.Collections.Generic.Dictionary_2(System.String, System.String)
    local serverInfo = load("return " .. selectedItem)()

    -- 添加服务器信息到字典
    serverDict:Add("ServerName", serverInfo.ServerName)
    serverDict:Add("ServerIP", serverInfo.ServerIP)
    serverDict:Add("ServerPort", serverInfo.ServerPort)

    -- 更新服务器版本信息
    CaiXiaChat.ServerVersion = serverInfo.Version

    -- 处理插件信息
    local plugins = string.split(serverInfo.Plugins, ",")
    for i = 1, #plugins do
        serverDict:Add("ServerPlugin" .. i, plugins[i])
    end

    -- 设置模板变量
    selectedItem.templateVars = serverDict
end
-- 刷新服务器列表
function CaiXiaChatSettingWindow.RefreshServerList(button)
    CaiXiaChatSettingWindow:GetServerList()
end

-- 加载服务器列表并更新UI
function CaiXiaChatSettingWindow.LoadServerList(sender, responseData)
    -- 检查响应数据是否有效
    if responseData == "" or string.find(responseData, "404") then
        CaiXiaChatSettingWindow.Servers.title = "获取服务器列表失败！"
        return
    end

    -- 清理数据并设置加载状态
    responseData = CaiXiaChatSettingWindow.ltrim(responseData)

    -- 解析JSON数据
    local serverList = CS.Newtonsoft.Json.JsonConvert.DeserializeObject(
        responseData,
        typeof(CS.System.Collections.Generic.List_1[System.Object])
    )

    -- 准备显示数据
    local displayNames = {}
    local serverValues = {}

    -- 处理每个服务器信息
    for _, server in ipairs(serverList) do
        local serverInfo = load("return " .. server.ToString())()
        table.insert(displayNames, serverInfo.ServerName)
        table.insert(serverValues, server.ToString())
    end

    -- 更新UI
    CaiXiaChatSettingWindow.Servers.items = displayNames
    CaiXiaChatSettingWindow.Servers.values = serverValues
    CaiXiaChatSettingWindow.Servers.selectedIndex = 0
end

-- 获取服务器列表
function CaiXiaChatSettingWindow.GetServerList(context)
    -- 创建服务器列表回调函数
    local function serverListCallback(response)
        return CaiXiaChatSettingWindow:LoadServerList(response)
    end

    -- 设置服务器列表状态
    if CaiXiaChatSettingWindow.Servers then
        CaiXiaChatSettingWindow.Servers.title = "获取服务器列表中..."
    end

    ResourceLoader = CS.UnityEngine.GameObject("ResourceLoader")
    CS.UnityEngine.Object.DontDestroyOnLoad(ResourceLoader)
    ResourceLoader:AddComponent(typeof(CS.ResourceLoader))
        :GetHTTPText("https://api.caixia.t2be.cn/api?type=serverlist&key=your_api_key&", serverListCallback)
end
-- WebSocket连接服务器
function CaiXiaChatSettingWindow.WsConnectServer(host, port, username, password)
    local websocket = XWebSocket.ws
    local username = CaiXiaChat.UserName
    local password = CaiXiaChat.PassWord

    -- 使用全局默认值
    if not host or host == "" then
        host = DefaultServerHost
    end
    if not port or port == "" then
        port = DefaultServerPort
    end
    
    if websocket then
        websocket:Connect(host, port, username, password)
        -- 连接成功后设置连接类型
        ChatSettingWindow.ConnectionType = "ws"
    else
        CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "WebSocket未初始化")
    end
end

-- 自动连接服务器（鲁棒性模式）
function CaiXiaSister.autoselfConnectServer(host, event)
    -- 设置默认参数
    host = host or DefaultServerHost
    local port = DefaultServerPort

    -- 保存当前设置
    CaiXiaChat:SaveSetting()

    -- 优先尝试WebSocket连接
    local wsSuccess, wsErr = pcall(function()
        CaiXiaChatSettingWindow.WsConnectServer(host, port, CaiXiaChatSettingWindow.UserName.text, CaiXiaChatSettingWindow.PassWord.text)
    end)

    if wsSuccess then
        return true, "WebSocket连接成功"
    end

    -- WebSocket连接失败，尝试Socket连接
    print("WebSocket连接失败，尝试Socket连接: ", wsErr)
    local socketSuccess, socketErr = pcall(function()
        CaiXiaChatSettingWindow.socketConnectServer(event)
    end)

    if socketSuccess then
        return true, "Socket连接成功"
    end

    -- 两种连接方式均失败
    print("Socket连接失败: ", socketErr)
    return false, "WebSocket和Socket连接均失败，请检查网络或服务器状态"
end



function CaiXiaChatSettingWindow.DisconnectServer(A0_52, A1_53)
  print("CaiXiaChatSettingWindow.DisconnectServer: A0_52 = ", A0_52, " A1_53 = ", A1_53)
  print("A1_53: ", A1_53)

  if ChatSettingWindow.ConnectionType == "ws" then
    -- WebSocket 断开逻辑
    if GameMain:GetMod("XWebSocket").ws and GameMain:GetMod("XWebSocket").ws.ReadyState ~= CS.WebSocketSharp.WebSocketState.Closed then
      GameMain:GetMod("XWebSocket"):Disconnect()
    else
      CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "WebSocket未连接！")
    end
  elseif ChatSettingWindow.ConnectionType == "socket" then
    -- Socket 断开逻辑
    if CaiXiaChat.status == "open" then
      CaiXiaChat.status = "closed"
      if CaiXiaChatSettingWindow.sock then
        CaiXiaChatSettingWindow.sock:close()
      end
    else
      CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "Socket未连接！")
    end
  else
    CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "未知连接形式！")
  end
end
function CaiXiaChatSettingWindow.CheckIP(A0_54)
  print("CaiXiaChatSettingWindow.CheckIP: A0_54 = ", A0_54)

	if type(A0_54) ~= "string" then
		return false
	end

	-- 检查是否为有效的IP地址
	local isIP = true
	local parts = {}
	for part in string.gmatch(A0_54, "([^.]+)") do
		table.insert(parts, part)
		if tonumber(part) == nil or tonumber(part) > 255 then
			isIP = false
			break
		end
	end
	if isIP and #parts == 4 then
		return A0_54
	end

	-- 检查是否为有效的域名
	local isValidDomain = string.match(A0_54, "^[%w-]+%.[%w-]+%.[%w-]+$") or string.match(A0_54, "^[%w-]+%.[%w-]+$")
	if not isValidDomain then
		return false
	end

	-- 解析域名
	local ipAddress = nil
	local success, result = pcall(function()
		local hostEntry = CS.System.Net.Dns.GetHostEntry(A0_54)
		if hostEntry and hostEntry.AddressList.Length > 0 then
			ipAddress = hostEntry.AddressList[0].ToString()
		end
	end)

	if not success or not ipAddress then
		return false
	end

	return ipAddress
end
-- 去除字符串左侧的空白字符（包括空格、制表符、换行符等）
function CaiXiaChatSettingWindow.ltrim(A0_63, A1_64)
	print("CaiXiaChatSettingWindow.ltrim: A0_63 = ", A0_63, " A1_64 = ", A1_64)
	return (string.gsub(A1_64, "^[ ﻿\t\n\r]+", ""))
end

-- 去除字符串右侧的空白字符（包括空格、制表符、换行符等）
function CaiXiaChatSettingWindow.rtrim(A0_65, A1_66)
	print("CaiXiaChatSettingWindow.rtrim: A0_65 = ", A0_65, " A1_66 = ", A1_66)
	return (string.gsub(A1_66, "[ ﻿\t\n\r]+$", ""))
end

function CaiXiaChatSettingWindow.ConnectToServer(host, port, name, userpwd)
	-- 初始化Socket连接
	self.sock = socket.tcp()
	self.sock:settimeout(0.01)
	
	-- 尝试连接服务器
	local success, err = self.sock:connect(host, port)
	if not success then
		CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "无法连接服务器！\n请确认设置后再试！")
		self.task = coroutine.create(ReceiveMsg)
		return
	end
	
	-- 连接成功后的逻辑
	ClearList()
	self.status = "open"
	self.jump = 0
	self.sock:send("Login," .. name .. "," .. CS.UnityEngine.Application.version .. "," .. CaiXiaChat.Version)
	ChatSettingWindow.ConnectionType = "socket"
	ChangeServerStatus(false)
	CaiXiaChatSettingWindow:Hide()
	CaiXiaChatWindow:Show()
end




-- todo ----

-- 处理窗口进入事件（暂未实现）
function CaiXiaChatSettingWindow.OnEnter(A0_9)
	print("CaiXiaChatSettingWindow.OnEnter: A0_9 = ", A0_9)
	local JsonMod0
end



-- 处理窗口显示更新事件（暂未实现）
function CaiXiaChatSettingWindow.OnShowUpdate(A0_11)
	print("CaiXiaChatSettingWindow.OnShowUpdate: A0_11 = ", A0_11)
	local JsonMod2
end
-- 处理窗口显示完成事件
function CaiXiaChatSettingWindow.OnShown(A0_13)
	print("CaiXiaChatSettingWindow.OnShown: A0_13 = ", A0_13)
	CaiXiaChatWindow:Hide()
	CaiXiaChatSettingWindow.isShowing = true
end
-- 处理窗口更新事件（暂未实现）
function CaiXiaChatSettingWindow.OnUpdate(A0_14)
	print("CaiXiaChatSettingWindow.OnUpdate: A0_14 = ", A0_14)
	local JsonMod5
end