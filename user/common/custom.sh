#!/bin/bash

# 更改默认源
sed -i 's/#src-git helloworld/src-git helloworld/g' feeds.conf.default # luci-app-ssr-plus -> ShadowSocksR Plus+

# 添加源
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# 修改默认IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 温度显示
sed -i '/Kernel Version/a\<tr><td width="33%"><%:CPU Temperature%></td><td><%=luci.sys.exec("cut -c1-2 /sys/class/thermal/thermal_zone0/temp")%></td></tr>' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

# 移除无用软件包
rm -rf luci-theme-argon package/lean # argon主题

# 添加额外软件包
git clone https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall # passwall依赖
git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages # 常用插件
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon # argon主题
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter # 应用过滤

# 去除默认密码
sed -i "s/sed -i 's\/root/# sed -i 's\/root/g" package/lean/default-settings/files/zzz-default-settings

echo "Apply common custom.sh"
