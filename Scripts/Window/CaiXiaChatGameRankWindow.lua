CaiXiaChatGameRankWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatGameRankWindow")
function CaiXiaChatGameRankWindow.OnInit(A0_0)
  CaiXiaChatGameRankWindow.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatGameRankWindow")
  CaiXiaChatGameRankWindow.window.closeButton = A0_0:GetChild("frame"):GetChild("n5")
  CaiXiaChatGameRankWindow.Title = A0_0:GetChild("frame")
  CaiXiaChatGameRankWindow.RankList = CaiXiaChatGameRankWindow:GetChild("n2")
  CaiXiaChatGameRankWindow:GetChild("n4").onClick:Add(function()
    CaiXiaChatGameRankWindow:Refresh()
  end)
  CaiXiaChatGameRankWindow:GetChild("n5").onClickItem:Add(function(A0_1)
    CaiXiaChatGameRankWindow:onClickItem(A0_1)
  end)
  CaiXiaChatGameRankWindow.RankList:GetChildAt(0):GetChild("data").text = "[color=#0000FF]耗时[/color]"
  CaiXiaChatGameRankWindow.Mode = 1
  CaiXiaChatGameRankWindow.Mode2Text = {}
  CaiXiaChatGameRankWindow.Mode2Text[1] = "All"
  CaiXiaChatGameRankWindow.Mode2Text[2] = "Daily"
  CaiXiaChatGameRankWindow.Mode2Text[3] = "Weekly"
  A0_0.window:Center()
end
function CaiXiaChatGameRankWindow.ShowGameRank(A0_2, A1_3)
  if A1_3 == "2048" then
--     CaiXiaChatGameRankWindow.GameName = A1_3
    CaiXiaChatGameRankWindow.Title.text = string.format("排行榜[%s]", A1_3)
  end
  CaiXiaChatGameRankWindow:Show()
end

function CaiXiaChatGameRankWindow.onClickItem(A0_11, A1_12)

    for _FORV_6_, _FORV_7_ in pairs(CaiXiaChatGameRankWindow.Mode2Text) do
    if _FORV_7_ == L2_13 then
      CaiXiaChatGameRankWindow.Mode = _FORV_6_
      CaiXiaChatGameRankWindow:Refresh()
      return
    end
  end
  CaiXiaChat:MsgBox("抱歉！不存在这个类型的排行榜！", "提示")
  CaiXiaChatGameRankWindow:Refresh()
end


function CaiXiaChatGameRankWindow.Refresh(A0_14)
  CaiXiaChatGameRankWindow.RankList:RemoveChildrenToPool()
  CaiXiaChatGameRankWindow.RankList:AddItemFromPool("ui://gfenp5kwxc8pkf"):GetChild("data").text = "[color=#0000FF]耗时[/color]"
  CaiXiaChat:SendMsg2("GetGameRankList", string.format("{\"GameName\":\"%s\",\"RankType\":\"%s\"}", CaiXiaChatGameRankWindow.GameName, CaiXiaChatGameRankWindow.Mode2Text[CaiXiaChatGameRankWindow.Mode]))
end

function CaiXiaChatGameRankWindow.UpdateRankList(A0_15, A1_16)
  CaiXiaChatGameRankWindow.RankList:RemoveChildrenToPool()
  CaiXiaChatGameRankWindow.RankList:AddItemFromPool("ui://gfenp5kwxc8pkf"):GetChild("data").text = "[color=#0000FF]耗时[/color]"
  for _FORV_7_ = 1, #GameMain:GetMod("Json").Json:decode(A1_16) do
    CaiXiaChatGameRankWindow.RankList:AddItemFromPool():GetChild("rank").text = GameMain:GetMod("Json").Json:decode(A1_16)[_FORV_7_].Rank
    CaiXiaChatGameRankWindow.RankList:AddItemFromPool().text = GameMain:GetMod("Json").Json:decode(A1_16)[_FORV_7_].Username
    CaiXiaChatGameRankWindow.RankList:AddItemFromPool():GetChild("data").text = GameMain:GetMod("Json").Json:decode(A1_16)[_FORV_7_].Score
  end
end
