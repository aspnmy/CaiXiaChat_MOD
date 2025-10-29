# -------Mod
万界修正群--了不起的修仙模拟器--联机Mod，已经是第三代修复的联机Mod了

# -------WinServer

- 客户端v1.19、v1.20系列对应的服务器端版本号v1.12，基础功能可以聊天、发送物品
- 客户端v6.4 对应的服务器端版本号v4.6
- 如需自建服务器主要客户端版本号和服务器版本号一致

# -------在Doker中部署winxp系统来运行Server
##  docker compose
```docker compose
services:
  windows-xp:
    image: dockurr/windows
    container_name: windows
    environment:
      DISK_SIZE: "10G"
      VERSION: "xp"
      RAM_SIZE: "4G"
      CPU_CORES: "4"
      LANGUAGE: "Chinese"
      REGION: "en-US"
      KEYBOARD: "en-US"
      USERNAME: "aspnmy"
      PASSWORD: "caixia"
    devices:
      - /dev/kvm
      - /dev/net/tun
    cap_add:
      - NET_ADMIN
    ports:
      - 7777:8006
      - 7489:3389/tcp
      - 7489:3389/udp
    volumes:
      - win-xp:/storage
    restart: always
    stop_grace_period: 2m
volumes:
  win-xp:
```
- 使用上面的文件在本地docker环境中安装winxp系统
- 运行 IP+7777 访问winXP的桌面
- 复制项目中Server中对应的服务器端到winXP中，运行对应服务器端
##  docker cli
``` dokcer cli
docker volume create win-xp
docker run --name windows -e DISK_SIZE=10G -e VERSION=xp -e RAM_SIZE=4G -e CPU_CORES=4 -e LANGUAGE=Chinese -e REGION=en-US -e KEYBOARD=en-US -e USERNAME=aspnmy -e PASSWORD=caixia --device /dev/kvm --device /dev/net/tun --cap-add NET_ADMIN -p 7777:8006 -p 7489:3389/tcp -p 7489:3389/udp -v win-xp:/storage --restart always --stop-timeout 2m dockurr/windows

```
  
