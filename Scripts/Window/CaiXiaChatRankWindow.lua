
CaiXiaChatRankWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatRankWindow")
function CaiXiaChatRankWindow.OnInit(A0_0)
  CaiXiaChatRankWindow.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatRankWindow")
  CaiXiaChatRankWindow.window.closeButton = A0_0:GetChild("frame"):GetChild("n5")
  CaiXiaChatRankWindow:GetChild("frame"):GetChild("title").text = "修仙排行榜"
  CaiXiaChatRankWindow.RankList = CaiXiaChatRankWindow:GetChild("n2")
  CaiXiaChatRankWindow:GetChild("n4").onClick:Add(CaiXiaChatRankWindow.Refresh)
  CaiXiaChatRankWindow:GetChild("n5").onClickItem:Add(CaiXiaChatRankWindow.onClickItem)
  CaiXiaChatRankWindow.Mode = 1
  CaiXiaChatRankWindow.Mode2Text = {}
  CaiXiaChatRankWindow.Mode2Text[1] = "修仙币"
  CaiXiaChatRankWindow.Mode2Text[2] = "捐助币"
  CaiXiaChatRankWindow.Mode2Text[3] = "侵略值"
  CaiXiaChatRankWindow.Mode2Text[4] = "协助值"
  A0_0.window:Center()
end
function CaiXiaChatRankWindow.OnEnter(A0_1)
  local L1_2
end
function CaiXiaChatRankWindow.OnShowUpdate(A0_3)
  CaiXiaChatRankWindow.isShowing = true
end
function CaiXiaChatRankWindow.OnShown(A0_4)
  CaiXiaChatRankWindow.isShowing = true
  CaiXiaChatRankWindow.Refresh()
end
function CaiXiaChatRankWindow.OnUpdate(A0_5)
  local L1_6
end
function CaiXiaChatRankWindow.OnHide(A0_7)
  CaiXiaChatRankWindow.isShowing = false
end
function  CaiXiaChatRankWindow.onClickItem(A0_8)
  local L1_9
    for _FORV_5_, _FORV_6_ in pairs(CaiXiaChatRankWindow.Mode2Text) do
    if _FORV_6_ == L1_9 then
      CaiXiaChatRankWindow.Mode = _FORV_5_
      CaiXiaChatRankWindow.Refresh()
      return
    end
  end
  CaiXiaChat:MsgBox("抱歉！不存在这个类型的排行榜！", "提示")
  CaiXiaChatRankWindow.Refresh()
end

function CaiXiaChatRankWindow.Refresh()
  CaiXiaChatRankWindow.RankList:RemoveChildrenToPool()
  CaiXiaChatRankWindow.RankList:AddItemFromPool("ui://gfenp5kwxc8pkf")
  CaiXiaChat:SendMsg2("GetRankList", string.format("\"%s\"", CaiXiaChatRankWindow.Mode))
end
function CaiXiaChatRankWindow.UpdateRankList(A0_10, A1_11)
  CaiXiaChatRankWindow.RankList:RemoveChildrenToPool()
  CaiXiaChatRankWindow.RankList:AddItemFromPool("ui://gfenp5kwxc8pkf"):GetChild("data").text = CaiXiaChatRankWindow.Mode2Text[CaiXiaChatRankWindow.Mode]
  for _FORV_7_ = 1, #load("return " .. A1_11)() do
    CaiXiaChatRankWindow.RankList:AddItemFromPool():GetChild("rank").text = load("return " .. A1_11)()[_FORV_7_].rank
    CaiXiaChatRankWindow.RankList:AddItemFromPool().text = load("return " .. A1_11)()[_FORV_7_].name
    CaiXiaChatRankWindow.RankList:AddItemFromPool():GetChild("data").text = load("return " .. A1_11)()[_FORV_7_].money
  end
end
