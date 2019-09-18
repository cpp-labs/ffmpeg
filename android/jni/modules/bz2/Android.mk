LOCAL_PATH:= $(call my-dir)
 
include $(CLEAR_VARS)

LOCAL_MODULE:= bz2
LOCAL_SRC_FILES:= build/Android/$(TARGET_ARCH_ABI)/lib/libbz2.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/build/Android/$(TARGET_ARCH_ABI)/include
#LOCAL_EXPORT_LDLIBS := -lz

include $(PREBUILT_STATIC_LIBRARY)
 