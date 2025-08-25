CaiXiaChatOpenRedPocketWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatOpenRedPocketWindow")
function CaiXiaChatOpenRedPocketWindow.OnInit(A0_0)
  CaiXiaChatOpenRedPocketWindow.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatOpenRedPocketWindow")
  CaiXiaChatOpenRedPocketWindow.window.closeButton = A0_0:GetChild("frame"):GetChild("n5")
  CaiXiaChatOpenRedPocketWindow.BagList = CaiXiaChatOpenRedPocketWindow:GetChild("n2")
  CaiXiaChatOpenRedPocketWindow.Info = CaiXiaChatOpenRedPocketWindow:GetChild("n5")
  CaiXiaChatOpenRedPocketWindow.Remains = CaiXiaChatOpenRedPocketWindow:GetChild("n6")
  A0_0.window:Center()
end
function CaiXiaChatOpenRedPocketWindow.OnEnter(A0_1)
  local L1_2
end
function CaiXiaChatOpenRedPocketWindow.OnShowUpdate(A0_3)
  CaiXiaChatOpenRedPocketWindow.isShowing = true
end
function CaiXiaChatOpenRedPocketWindow.OnShown(A0_4)
  CaiXiaChatOpenRedPocketWindow.isShowing = true
end
function CaiXiaChatOpenRedPocketWindow.OnUpdate(A0_5)
  local L1_6
end
function CaiXiaChatOpenRedPocketWindow.OnHide(A0_7)
  CaiXiaChatOpenRedPocketWindow.isShowing = false
end
function CaiXiaChatOpenRedPocketWindow.UpdateData(A0_8, A1_9)
  CS.System.Collections.Generic["Dictionary`2[System.String,System.String]"]():Add("TotalMoney", load("return " .. A1_9)().TotalMoney)
  CS.System.Collections.Generic["Dictionary`2[System.String,System.String]"]():Add("From", load("return " .. A1_9)().From)
  CS.System.Collections.Generic["Dictionary`2[System.String,System.String]"]():Add("Count", load("return " .. A1_9)().Count)
--   CS.System.Collections.Generic["Dictionary`2[System.String,System.String]"]():Add("TotalCount", load("return " .. A1_9)().TotalCount)
--   CaiXiaChatOpenRedPocketWindow.Info.templateVars = CS.System.Collections.Generic["Dictionary`2[System.String,System.String]"]()
  CaiXiaChatOpenRedPocketWindow.Remains.templateVars = CS.System.Collections.Generic["Dictionary`2[System.String,System.String]"]()
  CaiXiaChatOpenRedPocketWindow.BagList:RemoveChildrenToPool()
  for _FORV_8_ = 1, #load("return " .. A1_9)().Datas do
    CaiXiaChatOpenRedPocketWindow.BagList:AddItemFromPool().text = load("return " .. A1_9)().Datas[_FORV_8_].Name
    CaiXiaChatOpenRedPocketWindow.BagList:AddItemFromPool():GetChild("data").text = load("return " .. A1_9)().Datas[_FORV_8_].Money .. " 修仙币"
  end
  _FOR_:Show()
end
