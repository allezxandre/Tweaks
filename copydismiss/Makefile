ARCHS = armv7 arm64
include theos/makefiles/common.mk

TWEAK_NAME = CopyDismiss
CopyDismiss_FILES = Tweak.xm
CopyDismiss_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
