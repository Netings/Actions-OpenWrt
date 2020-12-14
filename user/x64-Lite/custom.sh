#!/bin/bash

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# Add Passwall
# git clone https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall # passwall依赖
# git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-package

# Modify default IP
sed -i 's/192.168.1.1/192.168.3.1/g' package/base-files/files/bin/config_generate

echo "Apply custom.sh"
