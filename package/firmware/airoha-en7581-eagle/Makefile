#
# Copyright (C) 2022 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=airoha-en7581-eagle
PKG_VERSION:=20251024
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/airoha-en7581-eagle
  TITLE:=Airoha EN7581 firmware for Eagle wlan NICs.
  SECTION:=firmware
  CATEGORY:=Firmware
endef

define Build/Compile

endef

define Package/airoha-en7581-eagle/install
	$(INSTALL_DIR) $(1)/lib/firmware/airoha
	$(CP) \
		./files/en7581_npu_data.bin \
		./files/en7581_npu_rv32.bin \
		$(1)/lib/firmware/airoha
endef

$(eval $(call BuildPackage,airoha-en7581-eagle))
