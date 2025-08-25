local JsonMod
GameMain = GameMain
JsonMod = GameMain
GameMain = GameMain.GetMod
GameMain = GameMain(JsonMod, "Windows")
JsonMod = GameMain.CreateWindow
JsonMod = JsonMod(GameMain, "CaiXiaChatSubMenu")
CaiXiaChatSubMenu = JsonMod
JsonMod = {}
JsonMod.TradeCenter = CaiXiaChatTradeCenterWindow
JsonMod.GameCenter = CaiXiaChatGameCenterWindow
JsonMod.CloudStorage = CS.CaiXiaChat.Wnd_CloudStorage.Instance
function CaiXiaChatSubMenu.OnInit(A0_2)
  CaiXiaChatSubMenu.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatSubMenu")
  CaiXiaChatSubMenu.ActionList = CaiXiaChatSubMenu:GetChild("n3")
  CaiXiaChatSubMenu.ActionList.onClickItem:Add(function(A0_3)
    CaiXiaChatSubMenu:SelectAction(A0_3)
  end)
end
function CaiXiaChatSubMenu.OnEnter(A0_4)
  local L1_5
end
function CaiXiaChatSubMenu.OnShowUpdate(A0_6)
  local L1_7
end
function CaiXiaChatSubMenu.OnShown(A0_8)
  local L1_9
      JsonMod.CloudStorage = L1_9
   L1_9.isShowing = true
   if L1_9 then
       L1_9.xy = GRoot.inst:GetPoupPosition(A0_8.window, nil, false)
  end
end
function CaiXiaChatSubMenu.OnUpdate(A0_10)
  local JsonMod1
end
function CaiXiaChatSubMenu.OnHide(A0_12)
  CaiXiaChatSubMenu.isShowing = false
end
function CaiXiaChatSubMenu.Cancel()
  CaiXiaChatSubMenu:Hide()
end
function CaiXiaChatSubMenu.SelectAction(A0_13, A1_14)
  local L2_15, L3_16
     if L3_16 then
    L3_16:Show()
  else
    print(L3_16)
    CaiXiaChat:MsgBox("无法开启指定窗口！\n请联系管理员！", "错误")
  end
  CaiXiaChatSubMenu:Hide()
end
