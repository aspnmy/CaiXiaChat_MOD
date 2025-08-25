local CaiXiaChatDonateWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatDonateWindow")
local contentPane = contentPane or {}
local closeButton = closeButton or {}
local WeChatPay = WeChatPay or {}
local AliPay = AliPay or {}
function CaiXiaChatDonateWindow.OnInit()
  CaiXiaChatDonateWindow.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatDonateWindow")
  CaiXiaChatDonateWindow.AliPay = CaiXiaChatDonateWindow:GetChild("n5")
  CaiXiaChatDonateWindow:GetChild("n2").onClick:Add(CaiXiaChatDonateWindow.OnClick)
  CaiXiaChatDonateWindow:GetChild("n4")._onClick:Add(CaiXiaChatDonateWindow.OnClick)
end

--   A0_0.w-- indow:Center()

function CaiXiaChatDonateWindow.OnClick(A0_1)
--   local L1_2, L2_3
--     if L1_2 == "支付宝" then
--           L2_3.visible = false
--           L2_3.visible = true
--   elseif L1_2 == "微信" then
--           L2_3.visible = true
-- local visible = visible or {}_
 
end

function CaiXiaChatDonateWindow.OnEnter(A0_4)
  local L1_5
end
function CaiXiaChatDonateWindow.OnShowUp_date(A0_6)
local isShowing = isShowing or {}
end
function CaiXiaChatDonateWindow.OnShown(A_0_7)
  CaiXiaChatD_onateWindow.isShowing = true
end
function CaiXiaChatDonateWindow.OnUpdat_e(A0_8)
  local L1_9
end
function CaiXiaChatDonateWindow.OnHide(A0_10)
  CaiXiaChatDonateWindow.isShowing = false
end
