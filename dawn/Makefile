#
# This software is licensed under the Public Domain.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dawn
PKG_VERSION:=0.1
PKG_REV:=master
PKG_RELEASE:=1
PKG_MAINTAINER:=Nick Hainke <vincent@systemli.org>

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/PolynomialDivision/dawn-test.git

PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz


define Package/dawn
	SECTION:=utils
	# Should this package be selected by default?
	#DEFAULT:=y
	CATEGORY:=Utilities
	TITLE:= Decentralized wifi controller.
	MAINTAINER:= Nick Hainke <vincent@systemli.org>
	URL:=https://polynomialdivision.github.io
	DEPENDS:=$(DRV_DEPENDS) +libubus +libubox +libblobmsg-json +libconfig #+ljson +ljson-c +lblobmsg_json  #+lblobmsg_json 
endef

define Package/dawn/description
	This package implements a decentralized wireless daemon.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/dawn/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dawn $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) files/dawn.init $(1)/etc/init.d/dawn
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) files/dawn.config $(1)/etc/config/dawn
endef

$(eval $(call BuildPackage,dawn))
