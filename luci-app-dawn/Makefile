include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-dawn
PKG_VERSION:=2018-03-08
PKG_MAINTAINER:=Nick Hainke <vincent@systemli.org>

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-dawn
  SECTION:=LuCI
  CATEGORY:=LuCI
  TITLE:=LuCI App for DAWN
  MAINTAINER:=Nick Hainke
  DEPENDS:=+luci
endef

LUCI_TITLE:=LuCI support for DAWN
LUCI_DEPENDS:=+dawn
LUCI_PKGARCH:=all

include luci.mk

# call BuildPackage - OpenWrt buildroot signature
