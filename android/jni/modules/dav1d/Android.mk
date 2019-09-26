LOCAL_PATH:= $(call my-dir)
 
include $(CLEAR_VARS)

LOCAL_MODULE:= dav1d
LOCAL_SRC_FILES:= build/Android/$(TARGET_ARCH_ABI)/lib/libdav1d.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/build/Android/$(TARGET_ARCH_ABI)/include/dav1d

ifneq (,$(wildcard $(LOCAL_PATH)/$(LOCAL_SRC_FILES)))
  include $(PREBUILT_STATIC_LIBRARY)
endif
