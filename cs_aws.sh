# Install Docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo docker --version

# Install Docker-Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Clone repo locally
mkdir ~/cs_server_1/
git clone https://github.com/piwneuh/csgo-server-scrim.git ~/cs_server_1/.

# Configure ports and source tokens
sed -i 's/SRCDS_TOKEN=CEEDB8BE64A0E50CDF313C67A7E0C55F/SRCDS_TOKEN=CEEDB8BE64A0E50CDF313C67A7E0C55F/g' ~/cs_server_1/docker-compose.yml

# Configure passwords
sed -i 's/hostname "UoY Esports"/hostname "defind"/g' ~/cs_server_1/custom_server_template.cfg
sed -i 's/sv_password ""/sv_password ""/g' ~/cs_server_1/custom_server_template.cfg
sed -i 's/rcon_password ""/rcon_password ""/g' ~/cs_server_1/custom_server_template.cfg

# Make install directory
mkdir ~/cs_server_1/csgo-data
chmod 777 ~/cs_server_1/csgo-data

# Run container composes
# TODO: add --env-file 
sudo docker-compose -f ~/cs_server_1/docker-compose.yml up -d



