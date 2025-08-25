CaiXiaChatTradeCenterWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatTradeCenterWindow")
function CaiXiaChatTradeCenterWindow.OnInit(A0_0)
  CaiXiaChatTradeCenterWindow.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatTradeCenterWindow")
  CaiXiaChatTradeCenterWindow.window.closeButton = A0_0:GetChild("frame"):GetChild("n5")
  CaiXiaChatTradeCenterWindow:GetChild("n3").onClick:Add(CaiXiaChatTradeCenterWindow.RefreshList)
  CaiXiaChatTradeCenterWindow:GetChild("n4").onClick:Add(CaiXiaChatTradeCenterWindow.NewTrade)
  CaiXiaChatTradeCenterWindow.List = CaiXiaChatTradeCenterWindow:GetChild("n2")
  CaiXiaChatTradeCenterWindow.NeedUpdate = true
  A0_0.window:Center()
end
function CaiXiaChatTradeCenterWindow.OnEnter(A0_1)
  local L1_2
end
function CaiXiaChatTradeCenterWindow.OnShowUpdate(A0_3)
  local L1_4
end
function CaiXiaChatTradeCenterWindow.OnShown(A0_5)
  CaiXiaChatTradeCenterWindow.isShowing = true
  CaiXiaChatTradeCenterWindow:ClearList()
  if CaiXiaChatTradeCenterWindow.NeedUpdate then
    CaiXiaChatTradeCenterWindow:RefreshList()
  else
    CaiXiaChatTradeCenterWindow:UpdateList()
  end
  CaiXiaChatTradeCenterWindow.NeedUpdate = false
end
function CaiXiaChatTradeCenterWindow.OnUpdate(A0_6)
  local L1_7
end
function CaiXiaChatTradeCenterWindow.OnHide(A0_8)
  CaiXiaChatTradeCenterWindow.isShowing = false
end
function CaiXiaChatTradeCenterWindow.UpdateList(A0_9)
  local JsonMod0, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17
  JsonMod0 = CaiXiaChat
  JsonMod0 = JsonMod0.TradeListData
    L3_12(L4_13)
  for L6_15, L7_16 in L3_12(L4_13) do
          L8_17.name = L7_16:GetValue("id"):ToString()
    L8_17:GetChild("from").text = L7_16:GetValue("from"):ToString()
    L8_17:GetChild("itemname").text = L7_16:GetValue("ItemName"):ToString()
    L8_17:GetChild("quantity").text = L7_16:GetValue("quantity"):ToString()
    L8_17:GetChild("price").text = L7_16:GetValue("price"):ToString()
    L8_17:GetChild("TradeBtn").onClick:Set(CaiXiaChatTradeCenterWindow.TradeBtn)
    if L8_17:GetChild("from").text == CaiXiaChat.UserName then
      L8_17:GetChild("TradeBtn").text = "取回"
    else
      L8_17:GetChild("TradeBtn").text = "交易"
    end
    L8_17.data = CS.CaiXiaChat.CaiXiaChat.SafeDeserializeTipTop(L7_16:GetValue("TipTopInfo"):ToString())
    CaiXiaChat:BindTipTop(L8_17)
  end
  L3_12.NeedUpdate = false
end
function CaiXiaChatTradeCenterWindow.onRollOver(A0_18)
  local JsonMod9
  JsonMod9 = A0_18.sender
  if JsonMod9.data ~= nil then
    CaiXiaChatTipPopPanel:UpdateData(JsonMod9.data)
    GRoot.inst:ShowPopup(CaiXiaChatTipPopPanel.window)
  end
end
function CaiXiaChatTradeCenterWindow.onRollOut(A0_20)
  GRoot.inst:HidePopup(CaiXiaChatTipPopPanel.window)
end
function CaiXiaChatTradeCenterWindow.ClearList(A0_21)
  local L1_22
    L1_22:RemoveChildrenToPool()
end
function CaiXiaChatTradeCenterWindow.TradeBtn(A0_23)
  local L1_24, WindowsMod5, L3_26
    WindowsMod5 = L1_24.name
    if L3_26 < tonumber(L1_24:GetChild("price").text) then
             if L3_26 ~= CaiXiaChat.UserName then
                     L3_26(nil, 1, nil, true, "修仙交易中心", 0, 0, "穷鬼！请检查一下你的钱包再来买东西！")
      return
    end
  end
     GameMain:GetMod("CaiXiaChat"):SendMsg2("GetTradeItem", L3_26)
  GameMain:GetMod("CaiXiaChat"):SendMsg2("GetTradeList", "{}")
end
function CaiXiaChatTradeCenterWindow.RefreshList()
  CaiXiaChatTradeCenterWindow:ClearList()
  CaiXiaChat.TradeListData = {}
  CaiXiaChatTradeCenterWindow.NeedUpdate = true
  GameMain:GetMod("CaiXiaChat"):SendMsg2("GetTradeList", "{}")
end
function CaiXiaChatTradeCenterWindow.NewTrade()
  world:EnterUILuaMode("CaiXiaChatSelect", "TradeItem")
end
