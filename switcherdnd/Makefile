ARCHS = armv7 arm64
TARGET = iphone:clang:8.1:8.1

include theos/makefiles/common.mk

TWEAK_NAME = DNDSwitch
DNDSwitch_FILES = Tweak.xm
DNDSwitch_FRAMEWORKS = UIKit Foundation
DNDSwitch_LIBRARIES = substrate
DNDSwitch_PRIVATE_FRAMEWORKS = SAObjects

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
