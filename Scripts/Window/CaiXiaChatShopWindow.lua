CaiXiaChatShopWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatShopWindow")
function CaiXiaChatShopWindow.OnInit(A0_0)
  CaiXiaChatShopWindow.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatShopWindow")
  CaiXiaChatShopWindow.window.closeButton = A0_0:GetChild("frame"):GetChild("n5")
  CaiXiaChatShopWindow.ShopList = CaiXiaChatShopWindow:GetChild("n2")
  CaiXiaChatShopWindow.Money = CaiXiaChatShopWindow:GetChild("n6")
  CaiXiaChatShopWindow.AtkMoney = CaiXiaChatShopWindow:GetChild("n11")
  CaiXiaChatShopWindow.HelpMoney = CaiXiaChatShopWindow:GetChild("n13")
  CaiXiaChatShopWindow.DonateMoney = CaiXiaChatShopWindow:GetChild("n15")
  CaiXiaChatShopWindow:GetChild("n1").onClick:Add(CaiXiaChatShopWindow.OnClickDonate)
  CaiXiaChatShopWindow:GetChild("n8").onClick:Add(CaiXiaChatShopWindow.ShowLottoWindow)
  A0_0.window:Center()
end
function CaiXiaChatShopWindow.OnEnter(A0_1)
  local L1_2
end
function CaiXiaChatShopWindow.OnShowUpdate(A0_3)
  CaiXiaChatShopWindow.isShowing = true
end
function CaiXiaChatShopWindow.OnShown(A0_4)
  CaiXiaChatShopWindow.isShowing = true
  CaiXiaChatShopWindow:GetShopList()
  CaiXiaChatShopWindow:GetCurrenies()
end
function CaiXiaChatShopWindow.OnUpdate(A0_5)
  local L1_6
end
function CaiXiaChatShopWindow.OnHide(A0_7)
  CaiXiaChatShopWindow.isShowing = false
end
function CaiXiaChatShopWindow.GetCurrenies(A0_8)
  local L1_9
    L1_9.text = tostring(CaiXiaChat.Currency)
    L1_9.text = CaiXiaChat.DonateMoney
    L1_9.text = CaiXiaChat.OtherCurrencies[1]
    L1_9.text = CaiXiaChat.OtherCurrencies[2]
end
function CaiXiaChatShopWindow.GetShopList(A0_10)
  CaiXiaChat:SendMsg2("GetShopList", "{}")
end
function CaiXiaChatShopWindow.UpdateShopList(A0_11, A1_12)
  CaiXiaChatShopWindow.ShopList:RemoveChildrenToPool()
  for _FORV_5_, _FORV_6_ in pairs(A1_12) do
    CaiXiaChatShopWindow.ShopList:AddItemFromPool().name = _FORV_6_:GetValue("ID"):ToString()
    CaiXiaChatShopWindow.ShopList:AddItemFromPool().text = _FORV_6_:GetValue("ItemName"):ToString()
    if _FORV_6_:ContainsKey("tooltips") then
      CaiXiaChatShopWindow.ShopList:AddItemFromPool().tooltips = _FORV_6_:GetValue("tooltips"):ToString()
    end
    if _FORV_6_:ContainsKey("Special") then
      CaiXiaChatShopWindow.ShopList:AddItemFromPool():GetChild("Special").visible = true
      CaiXiaChatShopWindow.ShopList:AddItemFromPool():GetChild("SpecialText").text = _FORV_6_:GetValue("Special"):ToString()
    end
    CaiXiaChatShopWindow.ShopList:AddItemFromPool():GetChild("icon").url = CaiXiaChatShopWindow:GetIcon(_FORV_6_:GetValue("icon"):ToString()) or ""
    CaiXiaChatShopWindow.ShopList:AddItemFromPool():GetChild("price").text = _FORV_6_:GetValue("Price"):ToString() .. _FORV_6_:GetValue("PriceType"):ToString()
    CaiXiaChatShopWindow.ShopList:AddItemFromPool():GetChild("buy").onClick:Set(CaiXiaChatShopWindow.BuyItem)
  end
end
function CaiXiaChatShopWindow.GetIcon(A0_13, A1_14)
  local L2_15
     if L2_15 == 1 then
             return CaiXiaChatWindow:GetIcon(tonumber(L2_15))
  end
     if L2_15 == 1 then
             return L2_15
  end
     if L2_15 == 1 then
    return A1_14
  end
   return L2_15
end
function CaiXiaChatShopWindow.OnClickDonate()
  CaiXiaChatDonateWindow:Show()
end
function CaiXiaChatShopWindow.ShowLottoWindow()
  CaiXiaChat:MsgBox("功能开发中...", "提示")
end
function CaiXiaChatShopWindow.BuyItem(A0_16)
  local JsonMod7, L3_18, L4_19
  JsonMod7 = A0_16.sender
  JsonMod7 = JsonMod7.parent
  JsonMod7 = JsonMod7.name
     L3_18(L4_19, "BuyItem", string.format("\"%s\"", JsonMod7))
end
