如果使用一次性脚本：

以下命令：

chmod +x start.sh

./start.sh


同时别忘了把域名和IP重新绑定！

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_


sudo apt update && sudo apt upgrade

\# 更新各种包

sudo apt purge needrestart

#解决树莓派kali安装linux-headers后提示的问题

apt install openjdk-17-jdk -y

apt install screen

\# 安装OpenJDK, 和Screen (screen是一个可以让程序后台运行的小工具）

wget https://meta.fabricmc.net/v2/versions/loader/1.19.3/0.14.22/0.11.2/server/jar -O minecraft\_server.1.19.3.jar

\# 下载Minecraft服务器文件


touch run.sh

chmod +x run.sh

\# 在本地创建一个脚本，设置脚本的运行权限，修改脚本内容


vi run.sh

#打开run.sh进行修改如下：

#!/bin/sh

java -Xms4G -Xmx5G -jar minecraft\_server.1.19.3.jar nogui



\# 首次运行

./run.sh

\# 首次运行后需要同意一个协议，打开eula.txt，把值设为true

vi eula.txt

\# 修改后的内容 eula=true

#如果不是Minecraft官方账号的话，可以禁用联网验证身份功能

vi server.properties

\# 将online-mode修改为false: online-mode=false


#端口22741

\# 修改query.port和server-port配置

sed -i 's/query.port=25565/query.port=22741/g' server.properties

sed -i 's/server-port=25565/server-port=22741/g' server.properties

\# 再次在screen中启动服务器，看到"Done (14.737s)!"之后，就启动成功了

screen ./run.sh
