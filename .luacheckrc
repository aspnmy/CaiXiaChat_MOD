---@diagnostic disable: lowercase-global
-- LuaCheck配置文件
-- 定义游戏引擎全局变量

globals = {
    "CS",           -- C# 命名空间
    "GameMain",     -- 游戏主模块
    "CaiXiaChat",        -- CaiXiaChat模块
    "CaiXiaChatWindow",  -- CaiXiaChat窗口
    "Windows",      -- 窗口模块
    "Json",         -- JSON模块
    "pcall",        -- Lua保护调用
    "table",        -- Lua表操作
    "print"         -- 打印函数
}

read_globals = {
    "CS",
    "GameMain",
    "CaiXiaChat",
    "CaiXiaChatWindow",
    "CaiXiaChatMiniGame2048",
    "CaiXiaChatSettingWindow",
    "CaiXiaChatTradeCenterWindow",
    "CaiXiaChatNewTradeWindow",
    "CaiXiaChatTipPopPanel",
    "CaiXiaChatOpenRedPocketWindow",
    "CaiXiaChatNewRedPocketWindow",
    "CaiXiaChatListMenu",
    "CaiXiaChatTransferMoneyWindow",
    "CaiXiaChatEmojiWindow",
    "CaiXiaChatAuctionWindow",
    "CaiXiaChatRankWindow",
    "CaiXiaChatGameRankWindow",
    "CaiXiaChatProfileWindow",
    "CaiXiaChatGameCenterWindow",
    "CaiXiaChatSubMenu",
    "CaiXiaChatMiniChatWindow",
    "CaiXiaChatShopWindow",
    "Windows",
    "Json"
}

-- 定义GameMain的方法
fields = {
    GameMain = {
        GetMod = "function"
    }
}
