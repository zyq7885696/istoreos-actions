#!/bin/bash

# 1. 默认主题为 Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 2. 关闭广告、VPN、多余插件（保持纯净）
sed -i '/autosamba/d' .config
sed -i '/ddns/d' .config
sed -i '/qemu/d' .config
sed -i '/dockerman/d' .config

# 3. 时区改为上海
sed -i "s/'UTC'/'Asia\/Shanghai'/g" package/base-files/files/bin/config_generate
