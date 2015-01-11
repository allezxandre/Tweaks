ARCHS = armv7 arm64
TARGET = iphone:clang:8.1:8.1

include theos/makefiles/common.mk

TWEAK_NAME = TorchSwitch
TorchSwitch_FILES = Tweak.xm
TorchSwitch_FRAMEWORKS = UIKit Foundation
TorchSwitch_LIBRARIES = Flipswitch
# DNDSwitch_LIBRARIES = substrate
DNDSwitch_PRIVATE_FRAMEWORKS = SAObjects

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
