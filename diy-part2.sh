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
sed -i 's/192.168.1.1/192.168.3.1/g' package/base-files/files/bin/config_generate

# 703n

sed -i 's/define Device\/tl-wr710n-v1/define Device\/tl-wr703n-v1/g' target/linux/ar71xx/image/generic-tp-link.mk
sed -i 's/$(Device\/tplink-8mlzma)/$(Device\/tplink-16mlzma)/g' target/linux/ar71xx/image/generic-tp-link.mk
sed -i 's/DEVICE_TITLE := TP-LINK TL-WR710N v1/DEVICE_TITLE := TP-LINK TL-WR703N v1/g' target/linux/ar71xx/image/generic-tp-link.mk
sed -i 's/BOARDNAME := TL-WR710N/BOARDNAME := TL-WR703N/g' target/linux/ar71xx/image/generic-tp-link.mk
sed -i 's/DEVICE_PROFILE := TLWR710/DEVICE_PROFILE := TLWR703/g' target/linux/ar71xx/image/generic-tp-link.mk
sed -i 's/TPLINK_HWID := 0x07100001/TPLINK_HWID := 0x07030101/g' target/linux/ar71xx/image/generic-tp-link.mk
sed -i 's/TARGET_DEVICES += tl-wr710n-v1/TARGET_DEVICES += tl-wr703n-v1/g' target/linux/ar71xx/image/generic-tp-link.mk
