CaiXiaChatProfileWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatProfileWindow")

function CaiXiaChatProfileWindow.OnInit(A0_0)
    CaiXiaChatProfileWindow.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatProfileWindow")
    CaiXiaChatProfileWindow.window.closeButton = CaiXiaChatProfileWindow:GetChild("frame"):GetChild("n5")
    
    -- 初始化UI组件
    CaiXiaChatProfileWindow.UserID = CaiXiaChatProfileWindow:GetChild("UserID")
    CaiXiaChatProfileWindow.UserName = CaiXiaChatProfileWindow:GetChild("n5")
    CaiXiaChatProfileWindow.Title = CaiXiaChatProfileWindow:GetChild("n10")
    CaiXiaChatProfileWindow.Icon = CaiXiaChatProfileWindow:GetChild("n12")
    CaiXiaChatProfileWindow.WelcomeText = CaiXiaChatProfileWindow:GetChild("n19")
    CaiXiaChatProfileWindow.IconListPanel = CaiXiaChatProfileWindow:GetChild("n25")
    CaiXiaChatProfileWindow.IconList = CaiXiaChatProfileWindow:GetChild("n24")
    
    -- 绑定事件
    CaiXiaChatProfileWindow.IconList.onClickItem:Add(function(A0_1)
        CaiXiaChatProfileWindow.onIconSelect(A0_1)
    end)
    
    CaiXiaChatProfileWindow.Icon.onClick:Add(function()
        if CaiXiaChatProfileWindow.IconListPanel then
            CaiXiaChatProfileWindow.IconListPanel.visible = not CaiXiaChatProfileWindow.IconListPanel.visible
        end
    end)
    
    CaiXiaChatProfileWindow:GetChild("n20").onClick:Add(function()
        CaiXiaChatProfileWindow:UpdateProfile()
    end)
    
    CaiXiaChatProfileWindow:GetChild("n21").onClick:Add(function()
        CaiXiaChatProfileWindow:GetProfile()
    end)
    
    A0_0.window:Center()
end

function CaiXiaChatProfileWindow.OnEnter(A0_4)
    -- 空函数体
end

function CaiXiaChatProfileWindow.OnShowUpdate(A0_6)
    CaiXiaChatProfileWindow.isShowing = true
end

function CaiXiaChatProfileWindow.OnShown(A0_7)
    CaiXiaChatProfileWindow.isShowing = true
end

function CaiXiaChatProfileWindow.OnUpdate(A0_8)
    -- 空函数体
end

function CaiXiaChatProfileWindow.OnHide(A0_10)
    CaiXiaChatProfileWindow.isShowing = false
end

function CaiXiaChatProfileWindow.GetProfile(A0_11)
    CaiXiaChat:SendMsg2("GetProfile", "{}")
end

function CaiXiaChatProfileWindow.LoadProfile(A0_12, A1_13)
    if not A1_13 then return end
    
    -- 更新用户信息
    CaiXiaChatProfileWindow.UserID.text = A1_13.ID or ""
    CaiXiaChatProfileWindow.UserName.text = A1_13.Name or ""
    CaiXiaChatProfileWindow.Title.text = A1_13.Title or ""
    CaiXiaChatProfileWindow.Icon.name = A1_13.Icon or 0
    
    -- 更新图标
    if CaiXiaChatProfileWindow.Icon.icon then
        CaiXiaChatProfileWindow.Icon.icon = CaiXiaChat.Icons[tonumber(A1_13.Icon)] or CaiXiaChatWindow:GetIcon(A1_13.Icon) or CaiXiaChatWindow:GetIcon(0)
    end
    
    -- 更新标题列表
    if A1_13.TitleList then
        CaiXiaChatProfileWindow.Title.items = A1_13.TitleList or {}
        CaiXiaChatProfileWindow.Title.values = A1_13.TitleList or {}
    end
    
    -- 更新图标列表
    if A1_13.IconList then
        CaiXiaChatProfileWindow.IconList:RemoveChildren()
        for i = 0, A1_13.IconList.Count - 1 do
            local item = CaiXiaChatProfileWindow.IconList:AddItemFromPool()
            item.icon = CaiXiaChat.Icons[tonumber(A1_13.IconList[i])] or CaiXiaChatWindow:GetIcon(A1_13.IconList[i]) or CaiXiaChatWindow:GetIcon(0)
            item.name = A1_13.IconList[i]
        end
    end
    
    -- 更新欢迎文本
    CaiXiaChatProfileWindow.WelcomeText.text = A1_13.WelcomeText or ""
end

function CaiXiaChatProfileWindow.UpdateProfile(A0_16)
    local profileData = {
        Name = CaiXiaChatProfileWindow.UserName.text,
        Title = CaiXiaChatProfileWindow.Title.text,
        Icon = CaiXiaChatProfileWindow.Icon.name,
        WelcomeText = CaiXiaChatProfileWindow.WelcomeText.text
    }
    CaiXiaChat:SendMsg2("UpdateProfile", Json.encode(profileData))
end

function CaiXiaChatProfileWindow.onIconSelect(A0_19)
    if not A0_19 then return end
    
    local selectedIcon = A0_19.data
    if selectedIcon then
        CaiXiaChatProfileWindow.Icon.icon = CaiXiaChat.Icons[tonumber(selectedIcon.name)] or CaiXiaChatWindow:GetIcon(selectedIcon.name) or CaiXiaChatWindow:GetIcon(0)
        CaiXiaChatProfileWindow.Icon.name = selectedIcon.name or 0
        CaiXiaChatProfileWindow.IconListPanel.visible = false
    end
end