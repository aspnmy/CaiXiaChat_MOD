
CaiXiaChatNewRedPocketWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatNewRedPocketWindow")
function CaiXiaChatNewRedPocketWindow.OnInit(A0_0)
--   CaiXiaChatNewRedPocketWindow.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatNewRedPocketWindow")
--   CaiXiaChatNewRedPocketWindow.window.closeButton = A0_0:GetChild("frame"):GetChild("n5")
--   CaiXiaChatNewRedPocketWindow.RedPocketType = CaiXiaChatNewRedPocketWindow:GetChild("n24")
--   CaiXiaChatNewRedPocketWindow.Bags = CaiXiaChatNewRedPocketWindow:GetChild("n12")
  CaiXiaChatNewRedPocketWindow.Amount = CaiXiaChatNewRedPocketWindow:GetChild("n15")
  CaiXiaChatNewRedPocketWindow:GetChild("n3").onClick:Add(CaiXiaChatNewRedPocketWindow.SendRedPocket)
  CaiXiaChatNewRedPocketWindow:GetChild("n2").onClick:Add(CaiXiaChatNewRedPocketWindow.Cancel)
  A0_0.window:Center()
end
function CaiXiaChatNewRedPocketWindow.OnEnter(A0_1)
  local L1_2
end
function CaiXiaChatNewRedPocketWindow.OnShowUpdate(A0_3)
  local L1_4
end
function CaiXiaChatNewRedPocketWindow.OnShown(A0_5)
  CaiXiaChatNewRedPocketWindow.isShowing = true
end
function CaiXiaChatNewRedPocketWindow.OnUpdate(A0_6)
  local L1_7
end
function CaiXiaChatNewRedPocketWindow.OnHide(A0_8)
  CaiXiaChatNewRedPocketWindow.isShowing = false
end
function CaiXiaChatNewRedPocketWindow.Cancel()
  CaiXiaChatNewRedPocketWindow:Hide()
end
function  CaiXiaChatNewRedPocketWindow.SendRedPocket()
  local L0_9, JsonMod0
   JsonMod0 = CaiXiaChatNewRedPocketWindow
  JsonMod0 = JsonMod0.Amount
  JsonMod0 = JsonMod0.text
   JsonMod0 = tonumber
  JsonMod0 = JsonMod0(CaiXiaChatNewRedPocketWindow.Bags.text)
  if L0_9 < 10 then
    CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "红包总金额不可以小于10！")
    return
  end
  if JsonMod0 < 1 then
    CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "数量不可以小于1！")
    return
  end
  if L0_9 < JsonMod0 * 5 then
    CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "数量不可以少于金额的五分之一！")
    return
  end
  if L0_9 > CaiXiaChat.Currency then
    CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "你没有这么多修仙币！")
    return
  end
--   CaiXiaChat:SendMsg2("NewRedPocket", string.format("{\"Type\":\"ShouQi\",\"TotalMoney\":%s,\"Bags\":%s}", L0_9, JsonMod0))
--   CaiXiaChatNewRedPocketWindow.Amount.text = ""
  CaiXiaChatNewRedPocketWindow.Bags.text = ""
  CaiXiaChatNewRedPocketWindow:Hide()
end
