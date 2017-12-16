#
# This software is licensed under the Public Domain.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=doing
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/PolynomialDivision/DOING.git
PKG_SOURCE_VERSION:=ab7a2422933d9ad4b4a23e2170b470455463b8b6
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
	$(INSTALL_DIR) $(1)/etc/doing
endef

$(eval $(call BuildPackage,doing))
