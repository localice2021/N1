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
# Add sources
svn co https://github.com/coolsnowwolf/lede.git/trunk/package/lean/luci-app-vsftpd /package/openwrt-packages
svn co https://github.com/coolsnowwolf/lede.git/trunk/package/lean/vsftpd-alt /package/openwrt-packages

# Modify default IP
sed -i 's/192.168.1.1/192.168.3.1/g' package/base-files/files/bin/config_generate

# Modify golang ver
sed -i '13,14d' feeds/packages/lang/golang/golang-version.mk
sed -i '$a GO_VERSION_MAJOR_MINOR:=1.17' feeds/packages/lang/golang/golang-version.mk
sed -i '$a GO_VERSION_PATCH:=3' feeds/packages/lang/golang/golang-version.mk
sed -i '21d' feeds/packages/lang/golang/golang/Makefile
sed -i 'N,21iPKG_HASH:=705c64251e5b25d5d55ede1039c6aa22bea40a7a931d14c370339853643c3df0' feeds/packages/lang/golang/golang/Makefile
# 703n

sed -i 's/define Device\/tl-wr710n-v1/define Device\/tl-wr703n-v1/g' target/linux/ar71xx/image/generic-tp-link.mk
sed -i 's/$(Device\/tplink-8mlzma)/$(Device\/tplink-16mlzma)/g' target/linux/ar71xx/image/generic-tp-link.mk
sed -i 's/DEVICE_TITLE := TP-LINK TL-WR710N v1/DEVICE_TITLE := TP-LINK TL-WR703N v1/g' target/linux/ar71xx/image/generic-tp-link.mk
sed -i 's/BOARDNAME := TL-WR710N/BOARDNAME := TL-WR703N/g' target/linux/ar71xx/image/generic-tp-link.mk
sed -i 's/DEVICE_PROFILE := TLWR710/DEVICE_PROFILE := TLWR703/g' target/linux/ar71xx/image/generic-tp-link.mk
sed -i 's/TPLINK_HWID := 0x07100001/TPLINK_HWID := 0x07030101/g' target/linux/ar71xx/image/generic-tp-link.mk
sed -i 's/TARGET_DEVICES += tl-wr710n-v1/TARGET_DEVICES += tl-wr703n-v1/g' target/linux/ar71xx/image/generic-tp-link.mk
