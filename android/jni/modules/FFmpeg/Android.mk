LOCAL_PATH:= $(call my-dir)
 
# avutil
include $(CLEAR_VARS)
LOCAL_MODULE    := avutil
LOCAL_SRC_FILES := build/Android/$(TARGET_ARCH_ABI)/lib/libavutil.a
include $(PREBUILT_STATIC_LIBRARY)

# avcodec
include $(CLEAR_VARS)
LOCAL_MODULE    := avcodec
LOCAL_SRC_FILES := build/Android/$(TARGET_ARCH_ABI)/lib/libavcodec.a
include $(PREBUILT_STATIC_LIBRARY)

# avformat
include $(CLEAR_VARS)
LOCAL_MODULE    := avformat
LOCAL_SRC_FILES := build/Android/$(TARGET_ARCH_ABI)/lib/libavformat.a
include $(PREBUILT_STATIC_LIBRARY)

# swscale
include $(CLEAR_VARS)
LOCAL_MODULE    := swscale
LOCAL_SRC_FILES := build/Android/$(TARGET_ARCH_ABI)/lib/libswscale.a
include $(PREBUILT_STATIC_LIBRARY)

# swresample
include $(CLEAR_VARS)
LOCAL_MODULE    := swresample
LOCAL_SRC_FILES := build/Android/$(TARGET_ARCH_ABI)/lib/libswresample.a
include $(PREBUILT_STATIC_LIBRARY)

# avfilter
include $(CLEAR_VARS)
LOCAL_MODULE    := avfilter
LOCAL_SRC_FILES := build/Android/$(TARGET_ARCH_ABI)/lib/libavfilter.a
include $(PREBUILT_STATIC_LIBRARY)

# Merge all static libraries.
include $(CLEAR_VARS)

LOCAL_MODULE:= libffmpeg

#LOCAL_LDFLAGS += -Wl,--fix-cortex-a8
LOCAL_LDLIBS := -lz 
LOCAL_STATIC_LIBRARIES := bz2 dav1d
LOCAL_SHARED_LIBRARIES := libopenssl 
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/build/Android/$(TARGET_ARCH_ABI)/include
LOCAL_DISABLE_FATAL_LINKER_WARNINGS := true

LOCAL_WHOLE_STATIC_LIBRARIES := swresample swscale avformat avcodec avutil #avfilter
include $(BUILD_SHARED_LIBRARY)


