CaiXiaChatEmojiWindow = GameMain:GetMod("Windows"):CreateWindow("CaiXiaChatEmojiWindow")
function CaiXiaChatEmojiWindow.OnInit(A0_0)
  CaiXiaChatEmojiWindow.window.contentPane = UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatEmojiWindow")
  CaiXiaChatEmojiWindow.window.contentPane.fairyBatching = true
  CaiXiaChatEmojiWindow.EmojiList = A0_0:GetChild("list")
  CaiXiaChatEmojiWindow:LoadEmoji()
  CaiXiaChatEmojiWindow.EmojiList.onClickItem:Add(CaiXiaChatEmojiWindow.ClickSelectItem)
end
function CaiXiaChatEmojiWindow.OnEnter(A0_1)
  local L1_2
end
function CaiXiaChatEmojiWindow.OnShowUpdate(A0_3)
  CaiXiaChatEmojiWindow.isShowing = true
end
function CaiXiaChatEmojiWindow.OnShown(A0_4)
  local L1_5
   L1_5.isShowing = true
   L1_5.xy = GRoot.inst:GetPoupPosition(A0_4.window, nil, false)
end
function CaiXiaChatEmojiWindow.OnUpdate(A0_6)
  local L1_7
end
function CaiXiaChatEmojiWindow.OnHide(A0_8)
  CaiXiaChatEmojiWindow.isShowing = false
end
function CaiXiaChatEmojiWindow.LoadEmoji(A0_9)
  -- 初始化表情符号集合
  CaiXiaChatEmojiWindow.Emojies = CS.System.Collections.Generic.Dictionary(System.Int32, CS.FairyGUI.Emoji)()
  
  -- 加载表情符号资源
  local emojiResources = {
    "ui://CaiXiaChat/1", "ui://CaiXiaChat/2", "ui://CaiXiaChat/3", "ui://CaiXiaChat/4", "ui://CaiXiaChat/5",
    "ui://CaiXiaChat/6", "ui://CaiXiaChat/7", "ui://CaiXiaChat/8", "ui://CaiXiaChat/9", "ui://CaiXiaChat/10"
  }
  
  -- 为每个表情符号创建FairyGUI Emoji对象并添加到集合中
  for i = 1, #emojiResources do
    local emojiCode = 194048 + i  -- Unicode表情符号编码
    local emojiResource = emojiResources[i]
    local emoji = CS.FairyGUI.Emoji(emojiResource, 28, 28)
    CaiXiaChatEmojiWindow.Emojies:Add(emojiCode, emoji)
  end
  
  -- 设置表情符号到列表
  CaiXiaChatEmojiWindow.EmojiList.emojies = CaiXiaChatEmojiWindow.Emojies
end
function CaiXiaChatEmojiWindow.ClickSelectItem(A0_18)
  local JsonMod9
  JsonMod9 = tonumber
  JsonMod9 = JsonMod9(A0_18.data.name)
  JsonMod9 = 194048 + JsonMod9
  CaiXiaChatWindow.SendText.text = CaiXiaChatWindow.SendText.text .. CS.System.Char.ConvertFromUtf32(JsonMod9)
end
