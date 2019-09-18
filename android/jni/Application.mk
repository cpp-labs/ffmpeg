APP_ABI := armeabi-v7a x86
APP_PLATFORM := android-14
APP_STL := c++_shared
APP_CPPFLAGS += -std=c++11 \
				-Wno-multichar \
				-Wno-return-type-c-linkage \
				-Wno-expansion-to-defined \
				-D_LIBCPP_VERSION \
				-D__STDINT_LIMITS \
				-D__STDINT_MACROS \
				-D__ANDROID__ 

APP_OPTIM := release

