#! /bin/bash

PEM_NAME="id_rsa.pem"
SSH_NAME="autosshd.service"
PWS_NAME="auto_poweroff.service"
PWT_NAME="auto_poweroff.timer"
PORT_FORWARDING="12000"
CPU_ID="000000000000000"
USER="pi"
PASS="12345678"

PEM_PATH="$HOME/.ssh/"${PEM_NAME}
SSH_SERVICE_PATH="/etc/systemd/system/"${SSH_NAME}
POWER_SERVICE_PATH="/etc/systemd/system/"${PWS_NAME}
POWER_TIMER_PATH="/etc/systemd/system/"${PWT_NAME}

clear_workspace() {
    echo "### Cleaning workspace..."
    rm -f ${PEM_NAME}
    rm -f ${SSH_NAME}
    rm -f ${PWS_NAME}
    rm -f ${PWT_NAME}
}

copy_files() {
    mkdir -p $HOME/.ssh/
    touch ${PEM_PATH}
    cp -r ${PEM_NAME} ${PEM_PATH}
    echo $PASS | sudo -S cp -r ${SSH_NAME} ${SSH_SERVICE_PATH}
    echo $PASS | sudo -S cp -r ${PWS_NAME} ${POWER_SERVICE_PATH}
    echo $PASS | sudo -S cp -r ${PWT_NAME} ${POWER_TIMER_PATH}
}

setup() {
    echo "### Installing script..."
    echo $PASS | sudo -S chmod 600 ${PEM_PATH}
    echo $PASS | sudo -S systemctl enable ${SSH_NAME}
    echo $PASS | sudo -S systemctl start ${SSH_NAME}
    echo $PASS | sudo -S systemctl enable ${PWT_NAME}
    echo $PASS | sudo -S systemctl start ${PWT_NAME}
}

prepare() {
    # read -s -p "Please input password: " PASS
    echo "### Preparing environment..."
    echo $PASS | sudo -S apt -qq install autossh
    CPU_ID=$(cat /proc/cpuinfo | grep Serial | cut -d ' ' -f 2)
    # CPU_ID=$(cat /sys/firmware/devicetree/base/serial-number)
    USER=$(lslogins -u | grep 1000 | awk '{ print $2 }')
    #GET PORT
    query_url='http://lpnserver.net:51083/reg?user='${USER}'&pass='${PASS}'&cpu='${CPU_ID}
    # echo $query_url
    PORT_FORWARDING=$(curl -s ${query_url} | awk '{print substr($0, 9, 5)}')
    echo "### => Get PORT: ${PORT_FORWARDING}"
}

write_files() {
cat << EOF > ${PEM_NAME}
-----BEGIN RSA PRIVATE KEY-----
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
-----END RSA PRIVATE KEY-----
EOF

cat << EOF > ${SSH_NAME}
[Unit]
Description=Auto SSH tunnel service
After=network.target

[Service]
Restart=always
RestartSec=20
User=pi
Environment="AUTOSSH_GATETIME=0"
ExecStart=/usr/bin/autossh -M 0 -o "StrictHostKeyChecking=no" -o "TCPKeepAlive=yes" -o "ExitOnForwardFailure=yes" -o "ServerAliveInterval 20" -o "ServerAliveCountMax 3" -i ~/.ssh/id_rsa.pem -nNT -R tunnel.lpnserver.net:${PORT_FORWARDING}:127.0.0.1:22 sshadmin@tunnel.lpnserver.net

[Install]
WantedBy=multi-user.target
EOF

cat << EOF > ${PWS_NAME}
[Unit]
Description=Power off service

[Service]
Type=oneshot
ExecStart=/usr/bin/sudo /usr/sbin/poweroff

[Install]
WantedBy=multi-user.target
EOF

cat << EOF > ${PWT_NAME}
[Unit]
Description=Timer of Power Off Service

[Timer]
OnBootSec=72000
Unit=auto_poweroff.service

[Install]
WantedBy=timers.target
EOF
}

echo "############################"
echo "###     START SETUP      ###"
echo "###======================###"
### Prepare
prepare
### Create Files
write_files
### Copy Files to Destination
copy_files
### Run setup script
setup
### Setup done => Clean workspace
clear_workspace
echo "###======================###"
echo "###    SETUP DONE!!!!    ###"
echo "############################"
