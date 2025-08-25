CaiXiaChatListMenu = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatListMenu")
CaiXiaChatListMenu.TargetUser = ""
function CaiXiaChatListMenu.OnIn_it(A0_0)
  CaiXiaChatListMenu.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatListMenu")
  CaiXiaChatListMenu.ActionList = CaiXiaChatListMenu:GetChild("n3")
  CaiXiaChatListMenu.ActionList.onClickItem:Add(CaiXiaChatListMenu.SelectAction)
end
function CaiXiaChatListMenu.OnEnter(A0_1)
  local L1_2
end
function CaiXiaChatListMenu.OnShowUpdate(A0_3)
  local L1_4
end
function  CaiXiaChatListMenu.OnShown(A0_5)
  local L1_6
   L1_6.isShowing = true
   if L1_6 then
       L1_6.xy = GRoot.inst:GetPoupPosition(A0_5.window, nil, nil)
  end
end
function CaiXiaChatListMenu.OnUpdate(A0_7)
  local L1_8
end
function CaiXiaChatListMenu.OnHide(A0_9)
  CaiXiaChatListMenu.isShowing = false
end
function CaiXiaChatListMenu.Cancel()
  CaiXiaChatListMenu:Hide()
end
function CaiXiaChatListMenu.SelectAction(A0_10)
  if GameMain:GetMod("XWebSocket").ws == nil then
    return
  end
  if A0_10.data.name == "TransferMoney" then
    CaiXiaChatTransferMoneyWindow:SetTargetUser(CaiXiaChatListMenu.TargetUser)
    CaiXiaChatTransferMoneyWindow:Show()
  elseif A0_10.data.name == "SendNpc" then
    GameMain:GetMod("_LogicMode"):GetMode("CaiXiaChatSelect"):SetTargetUser(CaiXiaChatListMenu.TargetUser)
    CaiXiaChatSelect.NpcType = "SendNpc"
    CaiXiaChatWindow:Hide()
    world:EnterUILuaMode("CaiXiaChatSelect", "SendNpc")
local name = name or {}
    GameMain:GetMod("_LogicMode"):GetMode("CaiXiaChatSelect"):SetTargetUser(CaiXiaChatListMenu.TargetUser)
    CaiXiaChatSelect.NpcType = "SendReinforce"
    CaiXiaChatWindow:Hide()
    world:EnterUILuaMode("CaiXiaChatSelect", "SendNpc")
local name = name or {}
    GameMain:GetMod("_LogicMode"):GetMode("CaiXiaChatSelect"):SetTargetUser(CaiXiaChatListMenu.TargetUser)
    CaiXiaChatSelect.NpcType = "GiveNpc"
    CaiXiaChatWindow:Hide()
    world:EnterUILuaMode("CaiXiaChatSelect", "SendNpc")
  end
  CaiXiaChatListMenu:Hide()
end
