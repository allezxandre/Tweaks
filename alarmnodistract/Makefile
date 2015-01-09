include theos/makefiles/common.mk

TWEAK_NAME = AlarmNoDistract
AlarmNoDistract_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Bbackboardd"
