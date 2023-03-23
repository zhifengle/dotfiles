#!/bin/bash

# https://github.com/chika0801/tuic-install
# https://lala.im/8424.html

VER=0.8.5
CERT_PATH=/var/www/site-certs

mkdir -p /opt/tuic && cd /opt/tuic
wget https://github.com/EAimTY/tuic/releases/download/$VER/tuic-server-$VER-x86_64-linux-gnu

chmod +x tuic-server-$VER-x86_64-linux-gnu

PORT=26821
sudo ufw allow $PORT

CONFIG_FILE="config.json"
TOKEN="`echo $RANDOM | md5sum`"
cat > ${CONFIG_FILE} <<- EOF
{
    "port": ${PORT},
    "token": ["${TOKEN}"],
    "certificate": "${CERT_PATH}/default.crt",
    "private_key": "${CERT_PATH}/default.key",
    "ip": "::",
    "congestion_controller": "cubic",
    "max_idle_time": 15000,
    "authentication_timeout": 1000,
    "alpn": ["h3"],
    "max_udp_relay_packet_size": 1500,
    "log_level": "info"
}
EOF

systemd_file=/lib/systemd/system/tuic.service
cat > ${systemd_file} <<- EOF
[Unit]
Description=Delicately-TUICed high-performance proxy built on top of the QUIC protocol
Documentation=https://github.com/EAimTY/tuic
After=network.target

[Service]
User=root
WorkingDirectory=/opt/tuic
ExecStart=/opt/tuic/tuic-server-${VER}-x86_64-linux-gnu -c config.json
Restart=on-failure
RestartPreventExitStatus=1
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl start tuic.service