CaiXiaChatGameCenterWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatGameCenterWindow")
  CaiXiaChatGameCenterWindow.window.closeButton = A0_0:GetChild("frame"):GetChild("n5")
  A0_0:GetChild("n1"):AddItemFromPool().name = "2048"
  A0_0:GetChild("n1"):AddItemFromPool().text = "2048"
  A0_0:GetChild("n1"):AddItemFromPool():GetChild("prizepool").text = "奖池：暂未开放"
  A0_0:GetChild("n1"):AddItemFromPool():GetChild("topinfo").text = "第一名：暂未开放"
  A0_0:GetChild("n1"):AddItemFromPool():GetChild("n4").onClick:Add(function(A0_1)
    CaiXiaChatGameCenterWindow:ShowGame(A0_1)
  end)
  A0_0:GetChild("n1"):AddItemFromPool():GetChild("n6").onClick:Add(function(A0_2)
    CaiXiaChatGameCenterWindow:ShowGameRank(A0_2)
  end)
  A0_0.window:Center()
  CaiXiaChatGameCenterWindow.isShowing = true
  CaiXiaChatGameCenterWindow.isShowing = true
  CaiXiaChatGameCenterWindow.isShowing = false
function CaiXiaChatGameCenterWindow.ShowGame(A0_6, A1_7)
  local L2_8
     if L2_8 == "2048" and not CaiXiaChatMiniGame2048.isShowing then
    CaiXiaChatMiniGame2048:Show()
  end
end

function  CaiXiaChatGameCenterWindow.ShowGameRank(A0_9, A1_10)
  local L2_11
     if L2_11 == "2048" then
    CaiXiaChatGameRankWindow:ShowGameRank(L2_11)
  end
end
