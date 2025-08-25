-- CaiXiaChat迷你聊天窗口模块
CaiXiaChatMiniChatWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatMiniChatWindow")

-- 窗口初始化
function CaiXiaChatMiniChatWindow.OnInit(rootNode)
    -- 创建UI内容面板
    CaiXiaChatMiniChatWindow.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "MiniChatWindow")
    
    -- 获取UI组件引用
    CaiXiaChatMiniChatWindow.window.closeButton = rootNode:GetChild("frame"):GetChild("n5")
    CaiXiaChatMiniChatWindow.chatInput = rootNode:GetChild("inputField")
    CaiXiaChatMiniChatWindow.chatDisplay = rootNode:GetChild("chatContent")
    CaiXiaChatMiniChatWindow.sendButton = rootNode:GetChild("sendBtn")
    CaiXiaChatMiniChatWindow.emojiButton = rootNode:GetChild("emojiBtn")
    
    -- 初始化状态变量
    CaiXiaChatMiniChatWindow.isShowing = false
    CaiXiaChatMiniChatWindow.messageHistory = {}
    CaiXiaChatMiniChatWindow.maxHistoryCount = 200  -- 最大历史消息数
    CaiXiaChatMiniChatWindow.lastMessageTime = 0    -- 最后消息时间戳
    
    -- 绑定UI事件
    CaiXiaChatMiniChatWindow.sendButton.onClick:Add(function()
        CaiXiaChatMiniChatWindow:SendChatMessage()
    end)
    
    CaiXiaChatMiniChatWindow.emojiButton.onClick:Add(function()
        CaiXiaChatMiniChatWindow:ShowEmojiPanel()
    end)
    
    -- 设置窗口属性
    CaiXiaChatMiniChatWindow.window:Center()
    CaiXiaChatMiniChatWindow.window.modal = true
end

-- 发送聊天消息
function CaiXiaChatMiniChatWindow:SendChatMessage()
    local messageContent = self.chatInput.text
    if not messageContent or string.len(messageContent) == 0 then
        return
    end
    
    -- 消息频率限制（3秒内只能发1条）
    local currentTime = CS.UnityEngine.Time.time
    if currentTime - self.lastMessageTime < 3 then
        CS.Wnd_Message.Show(nil, 1, nil, true, "提示", 0, 0, "消息发送太频繁，请稍后再试")
        return
    end
    self.lastMessageTime = currentTime
    
    -- 添加到历史记录
    table.insert(self.messageHistory, messageContent)
    if #self.messageHistory > self.maxHistoryCount then
        table.remove(self.messageHistory, 1)
    end
    
    -- 显示消息
    self:DisplayMessage("我", messageContent, os.date("%H:%M:%S"))
    
    -- 发送到服务器
    CaiXiaChat:SendMsg2("ChatMessage", Json.encode({
        sender = "玩家",
        content = messageContent,
        timestamp = os.time()
    }))
    
    -- 清空输入框
    self.chatInput.text = ""
end

-- 显示聊天消息
function CaiXiaChatMiniChatWindow:DisplayMessage(sender, content, timestamp)
    -- 格式化消息
    local formattedMsg = string.format("[%s] %s: %s", 
        timestamp or os.date("%H:%M:%S"), 
        sender or "系统", 
        content or "")
    
    -- 添加到聊天显示区域
    self.chatDisplay.text = self.chatDisplay.text .. "\n" .. formattedMsg
    
    -- 自动滚动到底部
    if self.chatDisplay.scrollPane then
        self.chatDisplay.scrollPane:ScrollBottom()
    end
    
    -- 播放消息音效
    CS.XiaWorld.AudioMgr.Instance:PlaySound("UI/ChatMessage")
end

-- 显示表情面板
function CaiXiaChatMiniChatWindow:ShowEmojiPanel()
    if not CaiXiaChatEmojiWindow then
        CaiXiaChatEmojiWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatEmojiWindow")
    end
    
    CaiXiaChatEmojiWindow:Show()
    CaiXiaChatEmojiWindow.OnEmojiSelect = function(emojiCode)
        self.chatInput.text = self.chatInput.text .. emojiCode
    end
end

-- 接收网络消息
function CaiXiaChatMiniChatWindow:OnNetworkMessage(msgType, msgData)
    if msgType == "ChatMessage" then
        local chatData = Json.decode(msgData)
        self:DisplayMessage(chatData.sender, chatData.content, os.date("%H:%M:%S", chatData.timestamp))
    end
end

-- 标准窗口方法
function CaiXiaChatMiniChatWindow.OnShowUpdate()
    CaiXiaChatMiniChatWindow.isShowing = true
    CaiXiaChatMiniChatWindow.window:BringToFront()
end

function CaiXiaChatMiniChatWindow.OnHide()
    CaiXiaChatMiniChatWindow.isShowing = false
end

function CaiXiaChatMiniChatWindow.OnEnter()
    -- 窗口获得焦点时的处理
end

function CaiXiaChatMiniChatWindow.OnUpdate()
    -- 每帧更新逻辑
end

-- 注册网络消息处理器
CaiXiaChat.RegisterMsgHandler("ChatMessage", CaiXiaChatMiniChatWindow.OnNetworkMessage)
