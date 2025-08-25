CaiXiaChatAuctionWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatAuctionWindow")
function CaiXiaChatAuctionWindow.OnInit(A0_0)
  CaiXiaChatAuctionWindow.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatAuctionWindow")
  CaiXiaChatAuctionWindow.window.closeButton = A0_0:GetChild("frame"):GetChild("n5")
  CaiXiaChatAuctionWindow:GetChild("frame"):GetChild("title").text = "修仙拍卖中心"
  CaiXiaChatAuctionWindow.AuctionList = CaiXiaChatAuctionWindow:GetChild("n2")
  CaiXiaChatAuctionWindow.AuctionList.onClickItem:Add(CaiXiaChatAuctionWindow.LoadAcutionData)
  CaiXiaChatAuctionWindow.SeatList = CaiXiaChatAuctionWindow:GetChild("n3")
  CaiXiaChatAuctionWindow.SeatList.onClickItem:Add(CaiXiaChatAuctionWindow.SeatClicked)
  CaiXiaChatAuctionWindow.AuctionMessages = CaiXiaChatAuctionWindow:GetChild("n25")
  CaiXiaChatAuctionWindow.AuctionCall = CaiXiaChatAuctionWindow:GetChild("n41")
  CaiXiaChatAuctionWindow:GetChild("n35").onClick:Add(CaiXiaChatAuctionWindow.Refresh)
  CaiXiaChatAuctionWindow.AuctionItemName = CaiXiaChatAuctionWindow:GetChild("n31")
  CaiXiaChatAuctionWindow.AuctionItemInfo = CaiXiaChatAuctionWindow:GetChild("n32")
  CaiXiaChatAuctionWindow.AuctionStartPrice = CaiXiaChatAuctionWindow:GetChild("n33")
  CaiXiaChatAuctionWindow.AuctionTime = CaiXiaChatAuctionWindow:GetChild("n34")
  CaiXiaChatAuctionWindow.AuctionPrice = CaiXiaChatAuctionWindow:GetChild("n37")
  CaiXiaChatAuctionWindow.AuctionState = CaiXiaChatAuctionWindow:GetChild("n39")
  A0_0.window:Center()
end
function CaiXiaChatAuctionWindow.OnEnter(A0_1)
  -- 初始化座位名称列表
  local seatNames = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
  
  -- 为座位列表中的每个座位设置名称
  for i = 0, CaiXiaChatAuctionWindow.SeatList.numItems - 1 do
    local seat = CaiXiaChatAuctionWindow.SeatList:GetChildAt(i)
    if seat and seatNames[i + 1] then
      seat.name = seatNames[i + 1]
      seat.text = "空位"  -- 设置默认显示文本
      seat:GetController("c1").selectedIndex = 0  -- 设置为空闲状态
    end
  end
end
function CaiXiaChatAuctionWindow.OnShowUpdate(A0_8)
  CaiXiaChatAuctionWindow.isShowing = true
end
function CaiXiaChatAuctionWindow.OnShown(A0_9)
  CaiXiaChatAuctionWindow.isShowing = true
end
function CaiXiaChatAuctionWindow.OnUpdate(A0_10)
  local JsonMod1
end
function CaiXiaChatAuctionWindow.OnHide(A0_12)
  CaiXiaChatAuctionWindow.isShowing = false
end
function CaiXiaChatAuctionWindow.Refresh()
  CaiXiaChatAuctionWindow.AuctionList:RemoveChildrenToPool()
  CaiXiaChatAuctionWindow.AuctionList:AddItemFromPool("ui://gfenp5kwkhpnkr")
  CaiXiaChat:SendMsg2("GetFullAcutionList", "{}")
end
function CaiXiaChatAuctionWindow.UpdateFullAcutionList(A0_13, A1_14)
  -- 清除测试数据，使用实际传入的数据
  -- A1_14 = "{{rank=\"1\",name=\"测试\",state=\"等待\",data={ID = \"1\";\n\tItemName='123',\n\tItemInfo='123',\n\tStartPrice='123',\n\tTime='5:00',\n\tPrice='23',\n\tState='123'}}\n\t}"
  
  CaiXiaChatAuctionWindow.AuctionList:RemoveChildrenToPool()
  
  -- 添加表头项
  local headerItem = CaiXiaChatAuctionWindow.AuctionList:AddItemFromPool("ui://gfenp5kwkhpnkr")
  
  -- 解析JSON数据
  local auctionData = load("return " .. A1_14)()
  if not auctionData or type(auctionData) ~= "table" then
    return
  end
  
  -- 添加拍卖项目
  for i, auctionItem in ipairs(auctionData) do
    local item = CaiXiaChatAuctionWindow.AuctionList:AddItemFromPool()
    if item then
      -- 设置排名
      local rankText = item:GetChild("rank")
      if rankText and auctionItem.rank then
        rankText.text = tostring(auctionItem.rank)
      end
      
      -- 设置名称
      if auctionItem.name then
        item.text = tostring(auctionItem.name)
      end
      
      -- 设置状态
      local stateText = item:GetChild("state")
      if stateText and auctionItem.state then
        stateText.text = tostring(auctionItem.state)
      end
      
      -- 设置数据
      if auctionItem.data then
        item.data = auctionItem.data
      end
    end
  end
end
function CaiXiaChatAuctionWindow.LoadAcutionData(A0_15)
  -- 获取点击的拍卖项数据
  local auctionItem = A0_15.data
  if not auctionItem or type(auctionItem) ~= "table" then
    return
  end
  
  -- 更新拍卖信息显示
  if auctionItem.ItemName then
    CaiXiaChatAuctionWindow.AuctionItemName.text = tostring(auctionItem.ItemName)
  end
  
  if auctionItem.ItemInfo then
    CaiXiaChatAuctionWindow.AuctionItemInfo.text = tostring(auctionItem.ItemInfo)
  end
  
  if auctionItem.StartPrice then
    CaiXiaChatAuctionWindow.AuctionStartPrice.text = tostring(auctionItem.StartPrice)
  end
  
  if auctionItem.Time then
    CaiXiaChatAuctionWindow.AuctionTime.text = tostring(auctionItem.Time)
  end
  
  if auctionItem.Price then
    CaiXiaChatAuctionWindow.AuctionPrice.text = tostring(auctionItem.Price)
  end
  
  if auctionItem.State then
    CaiXiaChatAuctionWindow.AuctionState.text = tostring(auctionItem.State)
  end
end
function CaiXiaChatAuctionWindow.SeatDown(A0_20, A1_21, A2_22)
  CaiXiaChatAuctionWindow.SeatList:GetChild(A1_21):GetChild("n3").visible = true
  CaiXiaChatAuctionWindow.SeatList:GetChild(A1_21).text = ""
  if A2_22 then
    CaiXiaChatAuctionWindow.SeatList:GetChild(A1_21):GetController("c1").selectedIndex = 2
  else
    CaiXiaChatAuctionWindow.SeatList:GetChild(A1_21):GetController("c1").selectedIndex = 1
  end
end
function CaiXiaChatAuctionWindow.GetUp(A0_23, A1_24)
  CaiXiaChatAuctionWindow.SeatList:GetChild(A1_24):GetChild("n3").visible = false
  CaiXiaChatAuctionWindow.SeatList:GetChild(A1_24).text = "空位"
  CaiXiaChatAuctionWindow.SeatList:GetChild(A1_24):GetController("c1").selectedIndex = 0
end
function CaiXiaChatAuctionWindow.SeatClicked(A0_25)
  local L1_26
   if L1_26:GetController("c1").selectedIndex == 0 then
    CaiXiaChat:SendMsg2("AuctionSeatDown", L1_26.name or -1)
  elseif L1_26:GetController("c1").selectedIndex == 1 then
  elseif L1_26:GetController("c1").selectedIndex == 3 then
    CaiXiaChat:SendMsg2("AuctionCallPrice", "")
  end
end
function CaiXiaChatAuctionWindow.PriceCalled(A0_27, A1_28)
  -- 解析价格调用数据
  local priceData = load("return " .. A1_28)()
  if not priceData or type(priceData) ~= "table" then
    return
  end
  
  local priceNumber = priceData.number
  local seatNumber = priceData.seat
  
  -- 更新出价显示
  CaiXiaChatAuctionWindow.AuctionCall.text = "出价\n" .. tostring(priceNumber)
  
  -- 添加消息记录
  CaiXiaChatAuctionWindow:AddMessage(tostring(priceNumber), false)
  
  -- 播放价格调用动画
  local callback = function()
    CaiXiaChatAuctionWindow:SeatDown(seatNumber, priceNumber)
  end
  
  CaiXiaChatAuctionWindow.window.contentPane:GetTransition("CallPrice"):Play(callback)
end
function CaiXiaChatAuctionWindow.AllMessage(A0_35, A1_36)
  CaiXiaChatAuctionWindow.AuctionMessages:RemoveChildrenToPool()
  for _FORV_6_ = 1, #load("return " .. A1_36)() do
    CaiXiaChatAuctionWindow:AddMessage(load("return " .. A1_36)()[_FORV_6_].price, load("return " .. A1_36)()[_FORV_6_].me)
  end
end
function CaiXiaChatAuctionWindow.AddMessage(A0_37, A1_38, A2_39)
  local L3_40
      CaiXiaChatAuctionWindow.AuctionMessages:AddChildAt(L3_40, 0)
  CS.System.Collections.Generic["Dictionary`2[System.String,System.String]"]():Add("time", CS.System.DateTime.Now:ToString("hh:mm:ss"))
  if A2_39 then
    CS.System.Collections.Generic["Dictionary`2[System.String,System.String]"]():Add("name", "你")
  else
    CS.System.Collections.Generic["Dictionary`2[System.String,System.String]"]():Add("name", "其他人")
  end
  CS.System.Collections.Generic["Dictionary`2[System.String,System.String]"]():Add("price", A1_38)
  L3_40:GetChild("title").templateVars = CS.System.Collections.Generic["Dictionary`2[System.String,System.String]"]()
end
