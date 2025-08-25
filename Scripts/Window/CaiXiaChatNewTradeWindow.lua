CaiXiaChatNewTradeWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatNewTradeWindow")
local CaiXiaChatSelect = GameMain:GetMod("_LogicMode"):GetMode("CaiXiaChatSelect")
function CaiXiaChatNewTradeWindow.OnInit(A0_0)
  CaiXiaChatNewTradeWindow.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatNewTradeWindow")
  CaiXiaChatNewTradeWindow.window.closeButton = A0_0:GetChild("frame"):GetChild("n5")
  CaiXiaChatNewTradeWindow:GetChild("frame"):GetChild("title").text = "创建新的交易"
  CaiXiaChatNewTradeWindow.ItemName = CaiXiaChatNewTradeWindow:GetChild("n9")
  CaiXiaChatNewTradeWindow.quantity = CaiXiaChatNewTradeWindow:GetChild("n12")
  CaiXiaChatNewTradeWindow.Price = CaiXiaChatNewTradeWindow:GetChild("n15")
  CaiXiaChatNewTradeWindow.Price.onChanged:Add(CaiXiaChatNewTradeWindow.PriceChanged)
  CaiXiaChatNewTradeWindow.Tax = CaiXiaChatNewTradeWindow:GetChild("n19")
  CaiXiaChatNewTradeWindow:GetChild("n2").onClick:Add(CaiXiaChatNewTradeWindow.Cancel)
  CaiXiaChatNewTradeWindow:GetChild("n3").onClick:Add(CaiXiaChatNewTradeWindow.SendTrade)
  CaiXiaChatNewTradeWindow.List = A0_0:GetChild("n2")
  CaiXiaChatNewTradeWindow.window:Center()
end
function CaiXiaChatNewTradeWindow.OnEnter(A0_1)
  local L1_2
end
function CaiXiaChatNewTradeWindow.OnShowUpdate(A0_3)
  if CaiXiaChatNewTradeWindow.ItemData ~= nil then
    print("Loaded Data:" .. CaiXiaChatNewTradeWindow.ItemData:GetName())
  else
    print("Load Data Failed.")
  end
  CaiXiaChatNewTradeWindow:LoadData()
end
function CaiXiaChatNewTradeWindow.OnShown(A0_4)
  CaiXiaChatNewTradeWindow.isShowing = true
end
function CaiXiaChatNewTradeWindow.OnUpdate(A0_5)
  local L1_6
end
function CaiXiaChatNewTradeWindow.OnHide(A0_7)
  CaiXiaChatNewTradeWindow.isShowing = false
end
function CaiXiaChatNewTradeWindow.Cancel()
  CaiXiaChatNewTradeWindow:Hide()
end
function CaiXiaChatNewTradeWindow.LoadData(A0_8)
  if CaiXiaChatNewTradeWindow.ItemData ~= nil then
    CaiXiaChatNewTradeWindow.ItemName.text = "<a herf=''>" .. CaiXiaChatNewTradeWindow.ItemData:GetName() .. "</a>"
    CaiXiaChatNewTradeWindow.quantity.text = CaiXiaChatNewTradeWindow.ItemData.Count
    CaiXiaChatNewTradeWindow.Price.text = "0"
    CaiXiaChatNewTradeWindow.Tax.text = "1"
  else
    CaiXiaChatNewTradeWindow.ItemName.text = ""
    CaiXiaChatNewTradeWindow.quantity.text = ""
    CaiXiaChatNewTradeWindow.Price.text = ""
    CaiXiaChatNewTradeWindow.Tax.text = ""
    CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "数据出错！\n请重新选择交易物品")
  end
  if CaiXiaChatSelect.TipTopInfo then
    CaiXiaChatNewTradeWindow.TipTopInfo = CaiXiaChatSelect.TipTopInfo
  else
    CaiXiaChatNewTradeWindow.TipTopInfo = "{}"
  end
end
function CaiXiaChatNewTradeWindow.SendTrade()
    -- 获取输入值并转换为数字
    local price = tonumber(CaiXiaChatNewTradeWindow.Price.text)
    local quantity = tonumber(CaiXiaChatNewTradeWindow.quantity.text)
    local tax = tonumber(CaiXiaChatNewTradeWindow.Tax.text)
    
    -- 验证价格
    if not price or price < 1 then
        CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "价格不可以小于1！")
        return
    end
    
    -- 验证手续费
    if not tax or price < tax then
        CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "你的钱不够交手续费哦！")
        return
    end
    
    -- 验证数量
    if not quantity or quantity < 1 then
        CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "数量不可以小于1！")
        return
    end
    
    -- 验证物品数量是否足够
    if quantity > CaiXiaChatNewTradeWindow.ItemData.Count then
        CS.Wnd_Message.Show(nil, 1, nil, true, "出错啦！", 0, 0, "你没有这么多数量的物品！")
        return
    end
    
    -- 构建交易数据
    local tradeData = {
        ItemName = CaiXiaChatNewTradeWindow.ItemData:GetName(),
        price = tostring(price),
        itemdata = CaiXiaChatNewTradeWindow.ItemData,
        TipTopInfo = CaiXiaChatNewTradeWindow.TipTopInfo
    }
    
    -- 发送交易请求
    CaiXiaChat:SendMsg2("NewTradeItem", Json.encode(tradeData))
    
    -- 移除物品并更新UI
    ThingMgr:RemoveThing(CaiXiaChatNewTradeWindow.ItemData, true, false)
    CaiXiaChatNewTradeWindow.ItemData = nil
    CaiXiaChatTradeCenterWindow.NeedUpdate = true
    
    -- 显示成功消息
    CS.Wnd_Message.Show(nil, 1, nil, true, "修仙交易中心", 0, 0, "你已经成功的发布了一个新的交易请求。")
    CaiXiaChatNewTradeWindow:Hide()
end

function CaiXiaChatNewTradeWindow.PriceChanged()
  CaiXiaChatNewTradeWindow.Tax.text = tostring(math.ceil(tonumber(CaiXiaChatNewTradeWindow.Price.text) / 10))
end
