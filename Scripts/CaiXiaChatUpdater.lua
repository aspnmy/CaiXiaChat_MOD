local CaiXiaChatUpdaterMod = GameMain:GetMod("CaiXiaChatUpdater")
local resourceLoader = CS.UnityEngine.GameObject("ResourceLoader")
resourceLoader:AddComponent(typeof(CS.ResourceLoader))
local coroutineRunner = CS.UnityEngine.GameObject("Coroutine_Runner")
CS.UnityEngine.Object.DontDestroyOnLoad(coroutineRunner)

-- 初始化前回调函数
function CaiXiaChatUpdaterMod.OnBeforeInit(mod)
    print("CaiXiaChatUpdater OnBeforeInit")
    CaiXiaChatUpdaterMod.Datas = {}
    CaiXiaChatUpdaterMod.Others = {}
    CaiXiaChatUpdaterMod.check = 0
    CaiXiaChatUpdaterMod.check2 = 0
end

-- 渲染回调函数
function CaiXiaChatUpdaterMod.OnRender(deltaTime)
    -- 渲染逻辑
end

-- 连接WebSocket服务器
function CaiXiaChatUpdaterMod.ConnectWebSocket(mod)
    print("CaiXiaChatUpdater ConnectWebSocket")
    -- 连接逻辑
end

-- 断开WebSocket连接
function CaiXiaChatUpdaterMod.DisconnectWebSocket(mod)
    print("CaiXiaChatUpdater DisconnectWebSocket")
    -- 断开逻辑
end

-- 发送消息
function CaiXiaChatUpdaterMod.SendMessage(mod, message)
    print("CaiXiaChatUpdater SendMessage:", message)
    -- 发送逻辑
end

-- 接收消息
function CaiXiaChatUpdaterMod.ReceiveMessage(mod, message)
    print("CaiXiaChatUpdater ReceiveMessage:", message)
    -- 接收逻辑
end

-- 错误处理
function CaiXiaChatUpdaterMod.OnError(mod, error)
    print("CaiXiaChatUpdater OnError:", error)
    -- 错误处理逻辑
end

-- 清理资源
function CaiXiaChatUpdaterMod.Cleanup(mod)
    print("CaiXiaChatUpdater Cleanup")
    -- 清理逻辑
end

return CaiXiaChatUpdaterMod