CaiXiaChatTransferMoneyWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatTransferMoneyWindow")
function CaiXiaChatTransferMoneyWindow.OnInit(A0_0)
  CaiXiaChatTransferMoneyWindow.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatTransferMoneyWindow")
  CaiXiaChatTransferMoneyWindow.window.closeButton = A0_0:GetChild("frame"):GetChild("n5")
  CaiXiaChatTransferMoneyWindow.TargetUser = CaiXiaChatTransferMoneyWindow:GetChild("n8")
  CaiXiaChatTransferMoneyWindow.Money = CaiXiaChatTransferMoneyWindow:GetChild("n15")
  CaiXiaChatTransferMoneyWindow.Money.onChanged:Add(CaiXiaChatTransferMoneyWindow.MoneyChanged)
  CaiXiaChatTransferMoneyWindow.Tax = CaiXiaChatTransferMoneyWindow:GetChild("n28")
  CaiXiaChatTransferMoneyWindow:GetChild("n2").onClick:Add(CaiXiaChatTransferMoneyWindow.Cancel)
  CaiXiaChatTransferMoneyWindow:GetChild("n3").onClick:Add(CaiXiaChatTransferMoneyWindow.SendTransfer)
  A0_0.window:Center()
end
function CaiXiaChatTransferMoneyWindow.OnEnter(A0_1)
  local L1_2
end
function CaiXiaChatTransferMoneyWindow.OnShowUpdate(A0_3)
  local L1_4
end
function CaiXiaChatTransferMoneyWindow.OnShown(A0_5)
  CaiXiaChatTransferMoneyWindow.isShowing = true
end
function CaiXiaChatTransferMoneyWindow.OnUpdate(A0_6)
  local L1_7
end
function CaiXiaChatTransferMoneyWindow.OnHide(A0_8)
  CaiXiaChatTransferMoneyWindow.isShowing = false
end
function CaiXiaChatTransferMoneyWindow.Cancel()
  CaiXiaChatTransferMoneyWindow:Hide()
end
function CaiXiaChatTransferMoneyWindow.SetTargetUser(A0_9, A1_10)
  local L2_11
    L2_11.text = A1_10
end
function CaiXiaChatTransferMoneyWindow.SendTransfer()
  local L0_12, JsonMod3
     JsonMod3 = tonumber
  JsonMod3 = JsonMod3(CaiXiaChatTransferMoneyWindow.Money.text)
  if JsonMod3 < 100 then
    CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "转账最低金额为100！")
    return
  end
  if CaiXiaChat.Currency < tonumber(CaiXiaChatTransferMoneyWindow.Tax.text) + JsonMod3 then
    CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "你的钱不够哦！")
    return
  end
  if L0_12 == "" then
    CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "没有选取收款用户！")
    return
  end
  CaiXiaChat:SendMsg2("TransferMoney", string.format("{\"TargetName\":\"%s\",\"Money\":\"%s\"}", L0_12, JsonMod3))
  CaiXiaChatTransferMoneyWindow.TargetUser.text = ""
  CaiXiaChatTransferMoneyWindow.Money.text = ""
  CaiXiaChatTransferMoneyWindow.Tax.text = "0"
  CaiXiaChatTransferMoneyWindow:Hide()
end
function CaiXiaChatTransferMoneyWindow.MoneyChanged()
  CaiXiaChatTransferMoneyWindow.Tax.text = tostring(math.ceil(tonumber(CaiXiaChatTransferMoneyWindow.Money.text) / 20))
end
