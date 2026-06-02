#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改openwrt登陆地址,把下面的 192.168.10.1 修改成你想要的就可以了
#sed -i 's/192.168.100.1/172.16.1.251/g' package/base-files/files/bin/config_generate

# 修改主机名字，把 iStore OS 修改你喜欢的就行（不能纯数字或者使用中文）
# sed -i 's/OpenWrt/iStore OS/g' package/base-files/files/bin/config_generate

# ttyd 自动登录
# sed -i "s?/bin/login?/usr/libexec/login.sh?g" ${GITHUB_WORKSPACE}/openwrt/package/feeds/packages/ttyd/files/ttyd.config

# 克隆第三方插件源码
git clone https://github.com/sirpdboy/luci-theme-kucat.git package/luci-theme-kucat
git clone https://github.com/sirpdboy/luci-app-kucat-config.git package/luci-app-kucat-config

# 如果需要 mosdns 和 openclash，也需要克隆它们的源码
git clone https://github.com/QiuSimons/openwrt-mos.git package/mosdns
git clone https://github.com/vernesong/OpenClash.git package/openclash

# 添加自定义软件包
echo '
CONFIG_PACKAGE_luci-app-mosdns=y
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-theme-kucat=y
CONFIG_PACKAGE_luci-app-kucat-config=y
' >> .config
