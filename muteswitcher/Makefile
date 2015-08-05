ARCHS = armv7 arm64
TARGET = iphone:clang:8.4:8.4

include theos/makefiles/common.mk

TWEAK_NAME = MuteSwitcher
MuteSwitcher_FILES = Tweak.xm
MuteSwitcher_FRAMEWORKS = UIKit Foundation
MuteSwitcher_PRIVATE_FRAMEWORKS = SBTelephonyManager

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
