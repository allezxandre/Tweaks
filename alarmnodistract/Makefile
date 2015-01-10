ARCHS = armv7 arm64
TARGET = iphone:clang:8.1:8.1

include theos/makefiles/common.mk

TWEAK_NAME = AlarmNoDistract
AlarmNoDistract_FILES = Tweak.xm
AlarmNoDistract_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
