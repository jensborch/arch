
pacman -S docker docker-compose
systemctl enable docker.service
# usermod -a -G docker "$USERNAME"

systemctl stop docker

# See https://www.mkubaczyk.com/2017/09/05/force-docker-not-bypass-ufw-rules-ubuntu-16-04/
echo "{\"iptables\": false}" > /etc/docker/daemon.json

sed -i -e 's/DEFAULT_FORWARD_POLICY="DROP"/DEFAULT_FORWARD_POLICY="ACCEPT"/g' /etc/default/ufw
ufw reload

# ip address
iptables -t nat -A POSTROUTING ! -o docker0 -s 172.17.0.0/16 -j MASQUERADE

systemctl start docker