#
# Copyright (C) 2022 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bridger
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/nbd168/bridger
#PKG_SOURCE_DATE:=2025-10-21
#PKG_SOURCE_VERSION:=95125f0b0be53b3b6fa6439641a75bedd962da09
#PKG_MIRROR_HASH:=64ae76c53622ba79261e42bad37cd7af193377ff1a4d170a4a1bdbdf10dd42ca

#PKG_SOURCE_DATE:=2024-04-22
#PKG_SOURCE_VERSION:=40b1c5b6be4e73a6749cf2997c664520eb20055d OK
#PKG_MIRROR_HASH:=b3ba2ab5ffa1af55f8da2cae5a90df486474b97ed4c359ec40c986aa6e82c300
#PKG_SOURCE_DATE:=2025-08-10
#PKG_SOURCE_VERSION:=544551f1beae85faf710a08cc8b2180153d97b00 OK
#PKG_MIRROR_HASH:=4a82ae327286eed160bd225d31daa35d538c45d6e4f8cf212a836fb38c056178
#PKG_SOURCE_DATE:=2025-09-01
#PKG_SOURCE_VERSION:=f6afcb04f2ef1af2677ce0b1e136118c4d4dd764 OK
#PKG_MIRROR_HASH:=ae8f13743ff2f06ab8eb91eb6d74a8c4275565e931fbee95842b56d86788edf6
#PKG_SOURCE_DATE:=2025-10-21
#PKG_SOURCE_VERSION:=95125f0b0be53b3b6fa6439641a75bedd962da09 KO
#PKG_MIRROR_HASH:=64ae76c53622ba79261e42bad37cd7af193377ff1a4d170a4a1bdbdf10dd42ca

#PKG_SOURCE_VERSION:=4dc5182c95a2ef1cdbd26908c5dc1abeeef78ee4 KO
#PKG_SOURCE_VERSION:=a3b08aa510e10164b5460a141f3b3ab1262c5460 KO

PKG_SOURCE_DATE:=2025-09-01
PKG_SOURCE_VERSION:=f6afcb04f2ef1af2677ce0b1e136118c4d4dd764
PKG_MIRROR_HASH:=ae8f13743ff2f06ab8eb91eb6d74a8c4275565e931fbee95842b56d86788edf6

PKG_LICENSE:=GPL-2.0
PKG_MAINTAINER:=Felix Fietkau <nbd@nbd.name>

PKG_BUILD_DEPENDS:=bpf-headers

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk
include $(INCLUDE_DIR)/bpf.mk
include $(INCLUDE_DIR)/nls.mk

define Package/bridger
  SECTION:=utils
  CATEGORY:=Base system
  TITLE:=Bridge forwarding accelerator
  DEPENDS:=+libbpf +libubox +libubus +libudebug +libnl-tiny +kmod-sched-core +kmod-sched-flower +kmod-sched-bpf +kmod-sched-act-vlan $(BPF_DEPENDS)
endef

TARGET_CFLAGS += \
	-I$(STAGING_DIR)/usr/include/libnl-tiny \
	-I$(STAGING_DIR)/usr/include

CMAKE_OPTIONS += \
	-DLIBNL_LIBS=-lnl-tiny \
	-DNL_UDEBUG=ON

define Build/Compile
	$(call CompileBPF,$(PKG_BUILD_DIR)/bridger-bpf.c)
	$(Build/Compile/Default)
endef

define Package/bridger/install
	$(INSTALL_DIR) \
		$(1)/etc/config \
		$(1)/etc/init.d \
		$(1)/lib/bpf \
		$(1)/usr/sbin
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/bridger-bpf.o $(1)/lib/bpf
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/bridger \
		$(1)/usr/sbin/
	$(INSTALL_DATA) ./files/bridger.conf $(1)/etc/config/bridger
	$(INSTALL_BIN) ./files/bridger.init $(1)/etc/init.d/bridger
endef

$(eval $(call BuildPackage,bridger))
