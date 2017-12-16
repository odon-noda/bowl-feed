#
# This software is licensed under the Public Domain.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=doing
PKG_RELEASE:=6

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/PolynomialDivision/DOING.git
PKG_SOURCE_VERSION:=38bdf3e3dc967c1acea10751fee1327ae7128c4c
PKG_MAINTAINER:=Nick Hainke <vincent@systemli.org>
CMAKE_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/doing
  SECTION:=net
  CATEGORY:=Network
  TITLE:= Monitoring Hostapd via ubus.
  MAINTAINER:= Nick Hainke <vincent@systemli.org>
  URL:=https://github.com/PolynomialDivision/DOING.git
  DEPENDS:=$(DRV_DEPENDS) +libubus +libubox +libblobmsg-json
endef

define Package/doing/description
 This package implements a daemon to monitor hostapd.
endef

define Package/doing/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/doing $(1)/usr/sbin/doing
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/doing.init $(1)/etc/init.d/doing
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/files/doing.config $(1)/etc/config/doing
	$(INSTALL_DIR) $(1)/etc/dawn
endef

$(eval $(call BuildPackage,dawn))
