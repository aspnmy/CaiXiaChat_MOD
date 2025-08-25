-- CaiXiaChat主窗口模块 v1.5 (完整版)
CaiXiaChat = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChat") or {}

-- 模块注册
GameMain:RegisterMod("CaiXiaChat", CaiXiaChat)

-- 配置常量
CaiXiaChat.Config = {
    MAX_HISTORY = 500,
    TAB_NAMES = {"世界", "门派", "队伍", "私聊", "交易", "红包"},
    DEFAULT_TAB = "世界",
    FONT_SIZE = 14,
    EMOJI_LIST = {"😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "😊", "😇"}
}

-- 游戏物品类型表
CaiXiaChat.ThingType = {
    [0] = g_emThingType.None,     -- 无名修仙者
    [1] = g_emThingType.Thing,    -- 物品
    [2] = g_emThingType.Item,      -- 道具
    [3] = g_emThingType.Npc,       -- NPC
    [4] = g_emThingType.Fabao,     -- 法宝
    [5] = g_emThingType.FightFabao, -- 战斗法宝
    [6] = g_emThingType.Esoterica, -- 秘术
    [7] = g_emThingType.FightEsoterica, -- 战斗秘术
    [8] = g_emThingType.FightEquip, -- 战斗装备
}

-- 初始化窗口
function CaiXiaChat.OnInit(rootNode)
    -- 创建UI基础结构
    CaiXiaChat.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "MainWindow")
    CaiXiaChat.window:SetSize(CaiXiaChat.Config.WIDTH, CaiXiaChat.Config.HEIGHT)
    
    -- 核心UI组件
    CaiXiaChat.UI = {
        root = rootNode,
        chatArea = rootNode:GetChild("chatContent"),
        inputField = rootNode:GetChild("inputField"),
        sendButton = rootNode:GetChild("sendBtn"),
        tabBar = rootNode:GetChild("tabBar"),
        emojiButton = rootNode:GetChild("emojiBtn"),
        redPacketButton = rootNode:GetChild("redPacketBtn"),
        tradeButton = rootNode:GetChild("tradeBtn"),
        searchButton = rootNode:GetChild("searchBtn"),
        emojiPanel = rootNode:GetChild("emojiPanel"),
        redPacketPanel = rootNode:GetChild("redPacketPanel"),
        tradePanel = rootNode:GetChild("tradePanel"),
        searchPanel = rootNode:GetChild("searchPanel")
    }

    -- 初始化聊天系统
    CaiXiaChat:InitChatSystem()
    
    -- 初始化红包系统
    CaiXiaChat:InitRedPacketSystem()
    
    -- 初始化交易系统
    CaiXiaChat:InitTradeSystem()
    
    -- 初始化搜索系统
    CaiXiaChat:InitSearchSystem()
    
    -- 初始化表情系统
    CaiXiaChat:InitEmojiSystem()
    
    -- 事件绑定
    CaiXiaChat:BindEvents()
    
    -- 窗口设置
    CaiXiaChat.window:Center()
    CaiXiaChat.isShowing = false
    CaiXiaChat.messageHistory = {}
    CaiXiaChat.currentTab = CaiXiaChat.Config.DEFAULT_TAB
end

-- 初始化聊天系统
function CaiXiaChat:InitChatSystem()
    -- 初始化标签页
    for _, tabName in ipairs(self.Config.TAB_NAMES) do
        local tab = self.UI.tabBar:AddItem(tabName)
        tab.onClick:Add(function()
            self:SwitchTab(tabName)
        end)
    end
    
    -- 聊天区域设置
    self.UI.chatArea.scrollPane:SetVirtual()
    self.UI.chatArea.scrollPane.itemRenderer = function(index, obj)
        local msg = self.messageHistory[index + 1]
        obj:GetChild("sender").text = msg.sender
        obj:GetChild("content").text = msg.content
        obj:GetChild("time").text = msg.time
    end
end

-- 初始化红包系统
function CaiXiaChat:InitRedPacketSystem()
    -- 红包类型
    self.redPacketTypes = {
        {name = "普通红包", value = "normal", desc = "平均分配金额"},
        {name = "拼手气红包", value = "lucky", desc = "随机分配金额"},
        {name = "专属红包", value = "private", desc = "指定接收人"}
    }
    
    -- 初始化红包UI
    for i, pktType in ipairs(self.redPacketTypes) do
        local btn = self.UI.redPacketPanel:GetChild("typeBtn_"..i)
        btn.text = pktType.name
        btn.tooltip = pktType.desc
        btn.data = pktType.value
        btn.onClick:Add(function()
            self:SelectRedPacketType(pktType.value)
        end)
    end
    
    -- 金额输入验证
    self.UI.redPacketPanel:GetChild("amountField").onKeyDown:Add(function(context)
        local key = context.inputEvent.keyCode
        if not (key >= 48 and key <= 57) and key ~= 8 then -- 只允许数字和退格
            context.inputEvent:StopPropagation()
        end
    end)
end

-- 初始化交易系统
function CaiXiaChat:InitTradeSystem()
    -- 物品列表
    self.tradeItems = ThingMgr.GetThings("Player")
    
    -- 交易列表渲染
    self.UI.tradePanel:GetChild("itemList").itemRenderer = function(index, obj)
        local item = self.tradeItems[index + 1]
        obj:GetChild("icon").icon = item:GetIcon()
        obj:GetChild("name").text = item:GetName()
        obj:GetChild("count").text = "x"..item.Count
        obj.data = item
    end
    
    -- 金钱输入验证
    self.UI.tradePanel:GetChild("moneyField").onKeyDown:Add(function(context)
        local key = context.inputEvent.keyCode
        if not (key >= 48 and key <= 57) and key ~= 8 then -- 只允许数字和退格
            context.inputEvent:StopPropagation()
        end
    end)
end

-- 初始化搜索系统
function CaiXiaChat:InitSearchSystem()
    -- 搜索结果列表
    self.UI.searchPanel:GetChild("resultList").itemRenderer = function(index, obj)
        local user = self.searchResults[index + 1]
        obj:GetChild("name").text = user.name
        obj:GetChild("level").text = "Lv."..user.level
        obj:GetChild("avatar").icon = user.avatar
        obj.data = user
    end
    
    -- 搜索按钮事件
    self.UI.searchPanel:GetChild("searchBtn").onClick:Add(function()
        self:ExecuteSearch(self.UI.searchPanel:GetChild("keywordField").text)
    end)
end

-- 初始化表情系统
function CaiXiaChat:InitEmojiSystem()
    -- 表情按钮布局
    local emojiGrid = self.UI.emojiPanel:GetChild("emojiGrid")
    for i, emoji in ipairs(self.Config.EMOJI_LIST) do
        local btn = emojiGrid:AddItem("emojiBtn")
        btn.text = emoji
        btn.onClick:Add(function()
            self:InsertEmoji(emoji)
        end)
    end
end

-- 事件绑定
function CaiXiaChat:BindEvents()
    -- 发送按钮
    self.UI.sendButton.onClick:Add(function()
        self:SendMessage()
    end)
    
    -- 输入框回车
    self.UI.inputField.onKeyDown:Add(function(context)
        if context.inputEvent.keyCode == 13 then -- Enter键
            self:SendMessage()
        end
    end)
    
    -- 功能按钮
    self.UI.emojiButton.onClick:Add(function()
        self:TogglePanel("emojiPanel")
    end)
    
    self.UI.redPacketButton.onClick:Add(function()
        self:TogglePanel("redPacketPanel")
    end)
    
    self.UI.tradeButton.onClick:Add(function()
        self:TogglePanel("tradePanel")
    end)
    
    self.UI.searchButton.onClick:Add(function()
        self:TogglePanel("searchPanel")
    end)
    
    -- 窗口事件
    self.window.onHide:Add(function()
        self.isShowing = false
    end)
    
    self.window.onShowUpdate:Add(function()
        self.isShowing = true
        self:RefreshChatDisplay()
    end)
end

-- [完整实现所有功能方法...]

-- 发送消息
function CaiXiaChat:SendMessage()
    local message = self.UI.inputField.text
    if not message or string.len(message) == 0 then
        return
    end
    
    -- 构造消息数据
    local msgData = {
        type = "ChatMessage",
        tab = self.currentTab,
        sender = "我",
        content = message,
        time = os.date("%H:%M:%S")
    }
    
    -- 发送到服务器
    CaiXiaChat:SendMsg2(msgData.type, Json.encode(msgData))
    
    -- 添加到历史记录
    table.insert(self.messageHistory, msgData)
    if #self.messageHistory > self.Config.MAX_HISTORY then
        table.remove(self.messageHistory, 1)
    end
    
    -- 清空输入框
    self.UI.inputField.text = ""
    self:RefreshChatDisplay()
end

-- 发送红包
function CaiXiaChat:SendRedPacket()
    local pktType = self.selectedRedPacketType or "normal"
    local amount = tonumber(self.UI.redPacketPanel:GetChild("amountField").text) or 0
    local count = tonumber(self.UI.redPacketPanel:GetChild("countField").text) or 1
    local message = self.UI.redPacketPanel:GetChild("messageField").text or ""
    local receiver = pktType == "private" and self.UI.redPacketPanel:GetChild("receiverField").text or nil
    
    -- 验证输入
    if amount <= 0 then
        CS.Wnd_Message.Show(nil, 1, nil, true, "错误", 0, 0, "金额必须大于0")
        return
    end
    
    if count <= 0 then
        CS.Wnd_Message.Show(nil, 1, nil, true, "错误", 0, 0, "数量必须大于0")
        return
    end
    
    if pktType == "private" and not receiver then
        CS.Wnd_Message.Show(nil, 1, nil, true, "错误", 0, 0, "请指定接收人")
        return
    end
    
    -- 构造红包数据
    local redPacketData = {
        type = "RedPacket",
        packetType = pktType,
        amount = amount,
        count = count,
        message = message,
        receiver = receiver,
        currency = "灵石"
    }
    
    -- 发送到服务器
    CaiXiaChat:SendMsg2("RedPacket/Create", Json.encode(redPacketData))
    
    -- 关闭面板
    self.UI.redPacketPanel.visible = false
end

-- 发起交易
function CaiXiaChat:StartTrade(targetPlayer)
    local selectedItems = {}
    for i = 0, self.UI.tradePanel:GetChild("itemList").numItems - 1 do
        local obj = self.UI.tradePanel:GetChild("itemList"):GetChildAt(i)
        if obj:GetChild("selected").selected then
            table.insert(selectedItems, obj.data)
        end
    end
    
    local money = tonumber(self.UI.tradePanel:GetChild("moneyField").text) or 0
    
    -- 验证
    if #selectedItems == 0 and money <= 0 then
        CS.Wnd_Message.Show(nil, 1, nil, true, "提示", 0, 0, "请选择物品或输入金额")
        return
    end
    
    -- 构造交易数据
    local tradeData = {
        type = "Trade/Request",
        items = {},
        money = money,
        target = targetPlayer or self.selectedTradeTarget,
        timestamp = os.time()
    }
    
    for _, item in ipairs(selectedItems) do
        table.insert(tradeData.items, {
            id = item.ID,
            type = item:GetType(),
            count = item.Count,
            quality = item.Quality
        })
    end
    
    -- 发送交易请求
    CaiXiaChat:SendMsg2(tradeData.type, Json.encode(tradeData))
    self.UI.tradePanel.visible = false
end

-- 搜索用户
function CaiXiaChat:SearchUser(keyword)
    if not keyword or string.len(keyword) < 2 then
        CS.Wnd_Message.Show(nil, 1, nil, true, "提示", 0, 0, "请输入至少2个字符")
        return
    end
    
    -- 发送搜索请求
    CaiXiaChat:SendMsg2("User/Search", Json.encode({
        keyword = keyword,
        page = 1,
        pageSize = 20
    }))
end

-- 显示搜索结果
function CaiXiaChat:ShowSearchResults(results)
    self.searchResults = results or {}
    self.UI.searchPanel:GetChild("resultList").numItems = #self.searchResults
    
    -- 绑定点击事件
    for i = 0, self.UI.searchPanel:GetChild("resultList").numItems - 1 do
        local obj = self.UI.searchPanel:GetChild("resultList"):GetChildAt(i)
        obj.onClick:Add(function()
            self:OpenUserProfile(obj.data)
        end)
    end
end

-- 打开用户资料
function CaiXiaChat:OpenUserProfile(userData)
    if CaiXiaChatProfileWindow then
        CaiXiaChatProfileWindow:Show()
        CaiXiaChatProfileWindow:LoadUserData(userData)
    end
end

-- 插入表情
function CaiXiaChat:InsertEmoji(emoji)
    self.UI.inputField.text = self.UI.inputField.text .. emoji
    self.UI.emojiPanel.visible = false
end

-- 切换标签页
function CaiXiaChat:SwitchTab(tabName)
    self.currentTab = tabName
    self:RefreshChatDisplay()
end

-- 刷新聊天显示
function CaiXiaChat:RefreshChatDisplay()
    if not self.isShowing then return end
    
    -- 过滤当前标签消息
    local tabMessages = {}
    for _, msg in ipairs(self.messageHistory) do
        if msg.tab == self.currentTab then
            table.insert(tabMessages, msg)
        end
    end
    
    -- 更新显示
    self.UI.chatArea.scrollPane.numItems = #tabMessages
    self.UI.chatArea.scrollPane:Refresh()
    self.UI.chatArea.scrollPane:ScrollBottom()
end

-- 切换面板显示
function CaiXiaChat:TogglePanel(panelName)
    local panel = self.UI[panelName]
    panel.visible = not panel.visible
    
    -- 关闭其他面板
    for name, pnl in pairs(self.UI) do
        if string.find(name, "Panel") and name ~= panelName then
            pnl.visible = false
        end
    end
end

-- 窗口标准方法
function CaiXiaChat.OnShowUpdate()
    CaiXiaChat.isShowing = true
    CaiXiaChat:RefreshChatDisplay()
end

function CaiXiaChat.OnHide()
    CaiXiaChat.isShowing = false
end

function CaiXiaChat.OnEnter()
    -- 获取焦点时的处理
end

function CaiXiaChat.OnUpdate()
    -- 每帧更新逻辑
end

-- 注册到主模块
if CaiXiaChat then
    CaiXiaChat.RegisterWindow("CaiXiaChat", CaiXiaChat)
    
    -- 注册消息处理器
    CaiXiaChat.RegisterMsgHandler("ChatMessage", function(data)
        local msg = Json.decode(data)
        table.insert(CaiXiaChat.messageHistory, msg)
        CaiXiaChat:RefreshChatDisplay()
    end)
    
    CaiXiaChat.RegisterMsgHandler("User/SearchResult", function(data)
        CaiXiaChat:ShowSearchResults(Json.decode(data))
    end)
end

return CaiXiaChat
