#!/bin/bash

# 更新各种包
sudo apt update
sudo apt upgrade -y

# 解决树莓派kali安装linux-headers后提示的问题
sudo apt purge needrestart

# 安装OpenJDK和Screen
sudo apt install openjdk-17-jdk -y
sudo apt install screen -y

# 下载Minecraft服务器文件
wget https://meta.fabricmc.net/v2/versions/loader/1.19.3/0.14.22/0.11.2/server/jar -O minecraft_server.1.19.3.jar

# 创建并编辑运行脚本
cat << EOF > run.sh
#!/bin/sh

java -Xms4G -Xmx5G -jar minecraft_server.1.19.3.jar nogui
EOF

chmod +x run.sh

./run.sh

# 修改eula.txt的内容
sed -i 's/eula=false/eula=true/g' eula.txt


#（可选）禁用联网验证身份功能
sed -i 's/online-mode=true/online-mode=false/g' server.properties

# 修改query.port和server-port配置
sed -i 's/query.port=25565/query.port=22741/g' server.properties
sed -i 's/server-port=25565/server-port=22741/g' server.properties

# 启动服务器
screen ./run.sh

