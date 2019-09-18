APP_ABI += arm64-v8a x86_64
APP_PLATFORM := android-21
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
