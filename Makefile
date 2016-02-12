include $(TOPDIR)/rules.mk

PKG_NAME:=unwired-gpio
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/unwired-gpio
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Unwired GPIO example
endef

define Package/unwired-gpio/description
 This is a GPIO example
endef

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	SUBDIRS="$(PKG_BUILD_DIR)"

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	make -C $(PKG_BUILD_DIR) \
	        $(TARGET_CONFIGURE_OPTS) \
	        CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS)" \
	        LIBS="$(TARGET_LDFLAGS)"
endef

define Package/unwired-gpio/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/blinking-led $(1)/usr/bin/
endef

$(eval $(call BuildPackage,unwired-gpio))