-- CaiXiaChat主窗口模块
CaiXiaChatWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatWindow")
CaiXiaChatMiniChatWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatMiniChatWindow")

-- 全局变量定义
CaiXiaChatWindow.TempDanMu = {}
CaiXiaChatWindow.isShowing = false
CaiXiaChatWindow.AutoScroll = true

-- 初始化窗口UI组件
function CaiXiaChatWindow.OnInit(window)
    -- 创建窗口内容
    CaiXiaChatWindow.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatWindow")
    
    -- 初始化UI组件引用
    CaiXiaChatWindow:initUIComponents(window)
    
    -- 设置事件监听器
    CaiXiaChatWindow:setupEventListeners()
    
    -- 初始化弹幕系统
    CaiXiaChatWindow:initDanMuSystem()
    
    -- 窗口设置
    CaiXiaChatWindow.window.contentPane.alpha = 0.8
    CaiXiaChatWindow.AutoScroll = true
    window.window:Center()
end

-- 初始化UI组件
function CaiXiaChatWindow:initUIComponents(window)
    -- 窗口标题
    self:GetChild("frame"):GetChild("title").text = "修仙聊天群 v" .. CaiXiaChat.Version
    
    -- 基础UI组件
    self.window.closeButton = window:GetChild("frame"):GetChild("n5")
    self.List = window:GetChild("n8")
    self.SearchList = window:GetChild("searchlist")
    self.SearchList.visible = false
    self.ListCount = window:GetChild("n9")
    self.ServerStatus = window:GetChild("n12")
    self.ChatList = window:GetChild("ChatList")
    self.ChatText = window:GetChild("n1"):GetChild("title")
    self.SendText = window:GetChild("n2"):GetChild("title")
    self.Currency = window:GetChild("n30")
    self.AdList = window:GetChild("n33")
    self.NoNotify = window:GetChild("n35")
    self.NewMessageTip = window:GetChild("n39")
    self.SearchUser = window:GetChild("n43")
    self.Help = window:GetChild("n40")
    
    -- 聊天文本设置
    self.ChatText.width = 425
    self.NoNotify.selected = false
    
    -- 初始化列表
    self.List:GetChildAt(0):GetChild("prefix").text = "系统NPC"
    self.List:GetChildAt(0).tooltips = "系统NPC"
    self.IconList = UIPackage.CreateObject("CaiXiaChat", "IconList")
end

-- 设置事件监听器
function CaiXiaChatWindow:setupEventListeners()
    -- 聊天文本事件
    self.ChatText.onClickLink:Add(self.onClickChatWindow)
    self.ChatText:AddEventListener("OnHtmlButtonClick", self.onHtmlButtonClick)
    
    -- 发送文本事件
    self.SendText.onKeyDown:Add(self.onKeyDown)
    
    -- 广告列表事件
    self.AdList.onClickLink:Add(self.AdLinkClicked)
    
    -- 按钮点击事件
    self:GetChild("n35").onClick:Add(self.NoNotifyClick)
    self:GetChild("n3").onClick:Add(self.SendMessage)
    self:GetChild("n20").onClick:Add(self.SendItem)
    self:GetChild("n4").onClick:Add(self.ShowShop)
    self:GetChild("n13").onClick:Add(self.SettingWindow)
    self:GetChild("n27").onClick:Add(self.ClearChatArea)
    self:GetChild("n28").onClick:Add(self.Emoji)
    self:GetChild("n36").onClick:Add(self.RankList)
    self:GetChild("n37").onClick:Add(self.NewRedPocket)
    
    -- 功能按钮事件
    self:GetChild("n41").onClick:Add(function()
        CaiXiaChatProfileWindow:GetProfile()
    end)
    
    self:GetChild("n46").onClick:Add(function()
        self:ShowMiniChat()
    end)
    
    self:GetChild("n47").onClick:Add(function()
        self:ShowSubMenu()
    end)
    
    -- 新消息提示事件
    self.NewMessageTip.onClick:Add(function()
        self.ChatList.scrollPane:ScrollBottom()
        self.NewMessageTip.visible = false
    end)
    
    -- 列表右键事件
    self.List.onRightClickItem:Add(self.ListRightClick)
    self.SearchList.onRightClickItem:Add(self.ListRightClick)
    
    -- 搜索用户事件
    self.SearchUser:GetChild("title").onChanged:Add(function(text)
        self:onSearchUser(text)
    end)
    
    -- 帮助按钮事件
    self.Help.onClick:Add(function(helpBtn)
        self:ShowHelp(helpBtn)
    end)
end

-- 初始化弹幕系统
function CaiXiaChatWindow:initDanMuSystem()
    self.DanMu = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatDanMu")
    self.DanMu:GetChild("n0").onClickLink:Add(self.AdLinkClicked)
    self.DanMu:GetChild("n0").height = 0
    
    -- 添加到舞台
    GRoot.inst:AddChild(self.DanMu):Center()
    GRoot.inst:AddChild(self.DanMu).y = 150
    GRoot.inst:AddChild(self.DanMu).sortingOrder = 1001
end

-- 窗口生命周期函数
function CaiXiaChatWindow.OnEnter(window)
    -- 空实现
end

function CaiXiaChatWindow.OnShowUpdate(window)
    -- 空实现
end

function CaiXiaChatWindow.OnShown(window)
    CaiXiaChatWindow.isShowing = true
end

function CaiXiaChatWindow.OnUpdate(window)
    -- 空实现
end

function CaiXiaChatWindow.OnHide(window)
    CaiXiaChatWindow.isShowing = false
end

-- 清理聊天区域
function CaiXiaChatWindow.ClearChatArea(button)
    CaiXiaChatWindow.ChatList:RemoveChildren()
    CaiXiaChatMiniChatWindow:UpdateData()
    xlua.private_accessible(CS.FairyGUI.DynamicFont)
    CS.FairyGUI.DynamicFont.textRebuildFlag = true
    CaiXiaChatWindow.AutoScroll = true
    CaiXiaChatMiniChatWindow.AutoScroll = true
end

-- 广告列表滚动
function CaiXiaChatWindow.AdListScroll(context)
    if CaiXiaChatWindow.AdList.scrollPane.percY == 1 then
        CaiXiaChatWindow.AdList.scrollPane:ScrollTop(true)
    else
        CaiXiaChatWindow.AdList.scrollPane:ScrollDown(1, true)
    end
    CaiXiaChatWindow.window.contentPane:GetTransition("t0"):Play(function()
        CaiXiaChatWindow:AdListScroll()
    end)
end

-- 弹幕变化处理
function CaiXiaChatWindow.DanMuChanged(context)
    CaiXiaChatWindow.DanMu:GetChild("n0").height = CaiXiaChatWindow.DanMu:GetChild("n0").numChildren * 30
    if #CaiXiaChatWindow.TempDanMu > 0 and CaiXiaChatWindow.DanMu:GetChild("n0").numChildren < 10 then
        CaiXiaChatWindow:AddDanMu(table.remove(CaiXiaChatWindow.TempDanMu))
    end
end

-- 广告链接点击处理
function CaiXiaChatWindow.AdLinkClicked(linkContext)
    if string.find(linkContext.data, "http://") or string.find(linkContext.data, "https://") then
        CS.UnityEngine.Application.OpenURL(linkContext.data)
    end
    if string.find(linkContext.data, "tencent://") and CS.System.Diagnostics.Process.GetProcessesByName("QQ").Length then
        CS.UnityEngine.Application.OpenURL(linkContext.data)
    end
end

-- 添加弹幕
function CaiXiaChatWindow.AddDanMu(context, danmuText)
    local danmuItem = CaiXiaChatWindow.DanMu:GetChild("n0"):AddItemFromPool()
    if danmuItem then
        danmuItem.title = danmuText
        danmuItem:GetTransition("t0"):Play(function()
            CaiXiaChatWindow.DanMu:GetChild("n0"):RemoveChildToPool(danmuItem)
            CaiXiaChatWindow:DanMuChanged()
        end)
    else
        table.insert(CaiXiaChatWindow.TempDanMu, danmuText)
    end
end

-- 更新货币显示
function CaiXiaChatWindow.UpdateCurrency(context, amount)
    CaiXiaChatWindow.Currency.text = "修仙币：" .. amount
end

-- 发送消息
function CaiXiaChatWindow.SendMessage(button)
    if CaiXiaChatWindow.SendText.text == nil or CaiXiaChatWindow.SendText.text == "" or CaiXiaChatWindow.SendText.text == " " then
        return
    end
    CaiXiaChatWindow.SendText.text = string.gsub(CaiXiaChatWindow.SendText.text, "\n\n?$", "")
    CaiXiaChat:SendMsg2("Chat", "\"" .. CaiXiaChat:TextFix(CaiXiaChatWindow.SendText.text) .. "\"")
    CaiXiaChatWindow.SendText.text = ""
end

-- 键盘按下事件
function CaiXiaChatWindow.onKeyDown(keyEvent)
    if keyEvent.inputEvent.character == 10 and CS.UnityEngine.Input.GetKey(CS.UnityEngine.KeyCode.LeftShift) == false then
        CaiXiaChatWindow.SendText.text = string.gsub(CaiXiaChatWindow.SendText.text, "\n\n?$", "")
        CaiXiaChatWindow.SendMessage()
    end
end

-- HTML按钮点击事件 -- 发送红包
function CaiXiaChatWindow.onHtmlButtonClick(buttonEvent)
    local buttonType = buttonEvent.data
    local buttonData = buttonEvent.context
    
    if buttonType == "RedPocket" or buttonType == "OpenRedPocket" then
        CaiXiaChat:SendMsg2("GetRedPocket", buttonData)
    end
end

-- 发送物品
function CaiXiaChatWindow.SendItem()
    if CaiXiaChat.Currency < 1 then
        CS.Wnd_Message.Show(nil, 1, nil, true, "修仙聊天群", 0, 0, "发送物品需要1修仙币的手续费哦！")
        return
    end
    CaiXiaChatWindow:Hide()
    world:EnterUILuaMode("CaiXiaChatSelect", "SendItem")
end

-- 显示设置窗口
function CaiXiaChatWindow.SettingWindow()
    CaiXiaChatSettingWindow:Show()
end

-- 显示商店
function CaiXiaChatWindow.ShowShop()
    CaiXiaChatShopWindow:Show()
end

-- 显示表情窗口
function CaiXiaChatWindow.Emoji(button)
    GRoot.inst:ShowPopup(CaiXiaChatEmojiWindow.window)
end

-- 显示排行榜
function CaiXiaChatWindow.RankList()
    CaiXiaChatRankWindow:Show()
end

-- 新建红包
function CaiXiaChatWindow.NewRedPocket()
    CaiXiaChatNewRedPocketWindow:Show()
end

-- 列表右键点击
function CaiXiaChatWindow.ListRightClick(itemEvent)
    CaiXiaChatListMenu.TargetUser = itemEvent.data.name
    if CaiXiaChatListMenu.TargetUser == "白前辈" then
        GRoot.inst:ShowPopup(CaiXiaChatSubMenu.window)
    else
        GRoot.inst:ShowPopup(CaiXiaChatListMenu.window)
    end
end

-- 获取图标
function CaiXiaChatWindow.GetIcon(context, iconId)
    if type(iconId) == "string" then
        iconId = tonumber(iconId)
    end
    if iconId < 10 then
        return false
    end
    if not CaiXiaChatWindow.IconList:GetChildAt(iconId - 10) then
        return false
    end
    return CaiXiaChatWindow.IconList:GetChildAt(iconId - 10).resourceURL
end

-- 搜索用户
function CaiXiaChatWindow.onSearchUser(searchText)
    if searchText == "" then
        CaiXiaChatWindow.SearchList.visible = false
        CaiXiaChatWindow.List.visible = true
        return
    end
    
    CaiXiaChatWindow.SearchList:RemoveChildren()
    
    for i = 0, CaiXiaChatWindow.List.numChildren - 1 do
        local listItem = CaiXiaChatWindow.List:GetChildAt(i)
        if string.find(listItem.name, searchText) then
            local searchItem = CaiXiaChatWindow.SearchList:AddItemFromPool()
            searchItem.icon = listItem.icon
            searchItem.name = listItem.name
            searchItem.text = listItem.text
            searchItem:GetChild("prefix").text = listItem:GetChild("prefix").text
            searchItem.data2 = listItem.data2
            searchItem.tooltips = listItem.tooltips
        end
    end
    
    CaiXiaChatWindow.List.visible = false
    CaiXiaChatWindow.SearchList.visible = true
end

-- 显示迷你聊天窗口
function CaiXiaChatWindow.ShowMiniChat()
    if CaiXiaChatWindow.isShowing == true and not CaiXiaChatMiniChatWindow.isShowing then
        CaiXiaChatWindow:Hide()
        CaiXiaChatMiniChatWindow:Show()
    end
end

-- 显示子菜单
function CaiXiaChatWindow.ShowSubMenu()
    GRoot.inst:ShowPopup(CaiXiaChatSubMenu.window)
end

-- 重建文本
function CaiXiaChatWindow.RebuildText(context)
    CS.FairyGUI.DynamicFont.textRebuildFlag = true
    CS.FairyGUI.Stage.inst._updateContext:Begin()
    CS.FairyGUI.Stage.inst:Update(CS.FairyGUI.Stage.inst._updateContext)
    CS.FairyGUI.Stage.inst._updateContext:End()
    CS.FairyGUI.DynamicFont.textRebuildFlag = false
end