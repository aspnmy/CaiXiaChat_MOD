CaiXiaChatTipPopPanel = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatTipPopPanel")
function CaiXiaChatTipPopPanel.OnInit(A0_0)
  local JsonMod
  JsonMod = CaiXiaChatTipPopPanel
  JsonMod = JsonMod.window
  JsonMod.contentPane = UIPackage.CreateObject("InGame", "Tip_PopPanel")
  JsonMod = CaiXiaChatTipPopPanel
  JsonMod.UIInfo = CaiXiaChatTipPopPanel.window.contentPane
  JsonMod = CaiXiaChatTipPopPanel
  JsonMod = JsonMod.UIInfo
  JsonMod.visible = true
  JsonMod = CaiXiaChatTipPopPanel
  JsonMod = JsonMod.UIInfo
  JsonMod.opaque = false
  JsonMod = CaiXiaChatTipPopPanel
  JsonMod = JsonMod.UIInfo
  JsonMod.touchable = false
end
function CaiXiaChatTipPopPanel.OnEnter(A0_2)
  local L1_3
end
function CaiXiaChatTipPopPanel.OnShowUpdate(A0_4)
  CaiXiaChatTipPopPanel.isShowing = true
end
function CaiXiaChatTipPopPanel.OnShown(A0_5)
  CaiXiaChatTipPopPanel.isShowing = true
end
function CaiXiaChatTipPopPanel.OnUpdate(A0_6)
  local L1_7
end
function CaiXiaChatTipPopPanel.OnHide(A0_8)
  CaiXiaChatTipPopPanel.isShowing = false
end
function CaiXiaChatTipPopPanel.UpdateData(A0_9, A1_10)
  local L2_11
   L2_11.xy = GRoot.inst:GetPoupPosition(A0_9, nil, nil)
    L2_11.value = tonumber(A1_10:GetValue("Ling"):ToString())
    L2_11.text = A1_10:GetValue("lingtxt"):ToString()
    L2_11.text = CS.System.Convert.FromBase64String(A1_10:GetValue("Name"):ToString())
     L2_11.selectedIndex = tonumber(A1_10:GetValue("ElementKind"):ToString())
    L2_11.text = A1_10:GetValue("ItemLalbe"):ToString()
    L2_11.value = A1_10:GetValue("Hp"):ToString()
    L2_11.text = CS.System.Convert.FromBase64String(A1_10:GetValue("Desc"):ToString())
    L2_11.text = A1_10:GetValue("hptext"):ToString()
    L2_11.visible = false
    L2_11.text = CS.System.Convert.FromBase64String(A1_10:GetValue("ThingInfo"):ToString())
end
