#!/bin/bash

# enable the BBR in the debian and ubuntu.
# check the kernel support BBR.  检查内核版本是否支持 BBR
kernel_version=$(uname -r)
if [ "$kernel_version" -lt "4.9" ]; then
  echo "Your kernel version is too low. BBR requires kernel version 4.9 or above."
  exit 1
fi

# check is the BBR already enabled. 检查 BBR 是否已经启用
sysctl net.ipv4.tcp_available_congestion_control | grep bbr > /dev/null
if [ $? -eq 0 ]; then
  echo "BBR is already enabled."
  exit 0
fi

# update the sysctl. 编辑 sysctl 配置文件
sudo tee /etc/sysctl.conf <<EOF
net.ipv4.tcp_congestion_control = bbr
EOF
 
sudo sysctl -p

# verify the bbr is enable. 验证是否生效
sysctl net.ipv4.tcp_congestion_control
