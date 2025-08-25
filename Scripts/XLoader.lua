-- XLoader模块初始化
local XLoaderModule, DecryptFunction, AESDecryptFunction, FileReadFunction, StringSplitFunction, TempVariable, CounterVar, IndexVar, ResultVar, BufferVar

-- 获取XLoader模块实例
XLoader = GameMain.GetMod("XLoader")
XLoaderModule = "yevnIie"

-- 基础解密函数
function DecryptFunction(inputStr)
    local decryptionKey = {
        1, 3, 4, 5, 6, 8, 11, 3, 5, 0, 7, 9, 8
    }
    
    local outputStr = ""
    for i = 1, 32 do
        outputStr = outputStr .. string.char((string.byte(inputStr, i) + decryptionKey[i]) % 256)
    end
    return outputStr
end

-- AES解密函数
function AESDecryptFunction(filePath)
    local aesModule = CS.Assets.USecurity.AES
    local encryptedData = CS.GFileUtil.ReadBytes(filePath, true)
    return aesModule.Decrypt(encryptedData, DecryptFunction(XLoaderModule))
end

-- 文件读取函数
function FileReadFunction(filePath)
    local fileHandle = io.open(filePath, "rb")
    if not fileHandle then return nil end
    
    local content = fileHandle:read("*a")
    fileHandle:close()
    return content
end

-- 字符串处理函数
function StringSplitFunction(inputStr, separator)
    local aesModule = CS.Assets.USecurity.AES
    return aesModule.Decrypt(separator, DecryptFunction(XLoaderModule))
end
GameMain.DecryptStr = StringSplitFunction

-- 加密字符串函数
function StringSplitFunction(salt, inputStr)
    local keyDerivation = CS.System.Security.Cryptography.Rfc2898DeriveBytes(
        DecryptFunction(XLoaderModule),
        string.char(table.unpack({88, 104, 83, 71, 57, 104, 76, 121, 90, 55, 84, 126, 71, 101, 51, 64})),
        16
    )
    
    local cryptoConfig = {
        Mode = CS.System.Security.Cryptography.CipherMode.CBC,
        Padding = CS.System.Security.Cryptography.PaddingMode.Zeros
    }
    
    local encryptor = CS.System.Security.Cryptography.RijndaelManaged()
    encryptor.Mode = cryptoConfig.Mode
    encryptor.Padding = cryptoConfig.Padding
    
    local iv = string.char(table.unpack({88, 118, 50, 64, 124, 123, 97, 68, 102, 98, 126, 56, 89, 83, 105, 48}))
    encryptor = encryptor.CreateEncryptor(keyDerivation.GetBytes(16), iv)
    
    local memoryStream = CS.System.IO.MemoryStream()
    local cryptoStream = CS.System.Security.Cryptography.CryptoStream(
        memoryStream, 
        encryptor,
        CS.System.Security.Cryptography.CryptoStreamMode.Write
    )
    
    cryptoStream:Write(inputStr, 0, #inputStr)
    cryptoStream:FlushFinalBlock()
    cryptoStream:Close()
    
    return memoryStream:ToArray()
end
GameMain.EncryptStr = StringSplitFunction

-- 文件加密函数
function StringSplitFunction(inputPath, outputPath)
    local content = FileReadFunction(inputPath)
    local outputFile = io.open(outputPath .. ".encrypt", "wb")
    outputFile:write(content)
    outputFile:close()
end
GameMain.EncryptFile = StringSplitFunction

-- DLL加载函数
function StringSplitFunction(dllPath)
    print(string.format("[CaiXiaChat]DLL加载耗时: %sms", 
        (CS.System.DateTime.Now:ToFileTime() - CS.System.DateTime.Now:ToFileTime()) / 10000))
    return CS.System.Reflection.Assembly.LoadFile(dllPath)
end

-- 安全加载函数
function TempVariable(modName, dllPath)
    local assembly
    xpcall(function()
        assembly = StringSplitFunction(dllPath)
    end, function(err)
        CS.Wnd_Message.Show(nil, 1, nil, true, "错误", 0, 0, "MOD加载失败: "..modName)
    end)
    return assembly
end
GameMain.LoadFile = TempVariable

-- 主加载逻辑
local isCaiXiaChatLoaded, xchatClient = pcall(function() return CS.CaiXiaChat.Client end)
if not isCaiXiaChatLoaded then
    local modManager = CS.ModsMgr.Instance
    local xchatMod = modManager.FindMod("CaiXiaChat_Fix") or 
                    modManager.FindMod("4141100caf48411889939ee27fea08f1", nil, true)
    
    if xchatMod then
        local dllPath = CS.System.IO.Path.Combine(xchatMod.Path, "CaiXiaChat.dll")
        local assembly = StringSplitFunction(dllPath)
        
        if assembly then
            -- 启用XLua私有访问
            xlua.private_accessible(CS.XLua.LuaEnv)
            xlua.private_accessible(CS.XLua.ObjectTranslator)
            
            -- 注册程序集
            CS.XiaWorld.LuaMgr.Instance.Env.translator.assemblies:Add(assembly)
            print("CaiXiaChat.dll 加载成功")
        end
    end
else
    print("CaiXiaChat.dll 已加载")
end
