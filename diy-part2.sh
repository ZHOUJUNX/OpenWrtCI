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

# Modify default IP
echo '### Updates default IP gate ###'
sed -i 's/192.168.1.1/10.1.1.10/g' package/base-files/luci2/bin/config_generate
echo '###  ###'

# echo '### Updates Theme Argon ###'
# package/lean/luci-theme-argon /package/feeds/luci/luci-theme-argon
rm -rf package/feeds/luci/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git package/feeds/luci/luci-theme-argon
echo '###  ###'

echo '### 修复 luci-app-syncdial 检测的 bug ###'
rm -rf package/feeds/luci/luci-app-syncdial
git clone https://github.com/BenjaminX/luci-app-syncdial.git package/feeds/luci/luci-app-syncdial
sed -i 's/is online and tracking is active/and tracking is active/' package/feeds/luci/luci-app-syncdial/luasrc/model/cbi/syncdial.lua
echo '###  ###'
