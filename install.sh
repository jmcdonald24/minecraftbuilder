
sudo yum update -y
sudo yum install screen -y
sudo yum install wget -y
sudo yum install nano -y
sudo yum install java-1.7.0-openjdk -y

wget -O jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
chmod +x ./jq
sudo mv jq /usr/bin

myVar=`curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | jq '.latest.release' -r`
sudo rm -r minecraft
sudo mkdir minecraft
cd minecraft
sudo wget -O minecraft_server.jar https://s3.amazonaws.com/Minecraft.Download/versions/$myVar/minecraft_server.$myVar.jar
sudo java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui
sudo sed -i 's/false/true/g' eula.txt
sudo java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui
