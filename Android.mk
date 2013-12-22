LOCAL_PATH := $(call my-dir)

ifneq ($(BOARD_HAVE_BLUETOOTH_BLUEZ), true)
# Setup bdroid local make variables for handling configuration
ifneq ($(BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR),)
  bdroid_C_INCLUDES := $(BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR)
  bdroid_CFLAGS := -DHAS_BDROID_BUILDCFG
else
  $(warning NO BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR, using only generic configuration)
  bdroid_C_INCLUDES :=
  bdroid_CFLAGS := -DHAS_NO_BDROID_BUILDCFG
endif

ifneq ($(call is-board-platform-in-list, msm8930 ),true)
 ifeq ($(TARGET_USE_SBC_DECODER),true)
  bdroid_CFLAGS += -DBTA_AVK_INCLUDED
 endif
endif

include $(call all-subdir-makefiles)

endif
# Cleanup our locals
bdroid_C_INCLUDES :=
bdroid_CFLaGS :=
