COMMON_PATH := device/shift/mt6797-common

# Platform
TARGET_BOARD_PLATFORM := mt6797
TARGET_BOARD_PLATFORM_GPU := mali-t880mp4
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Assert
TARGET_BOARD_INFO_FILE := $(COMMON_PATH)/board-info.txt
TARGET_OTA_ASSERT_DEVICE := SHIFT5me,SHIFT6m

# Audio
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Broken rules
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true

# Display
TARGET_SCREEN_DENSITY := 420

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/shift/mt6797
TARGET_KERNEL_ADDITIONAL_FLAGS += \
    HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

# Boot image
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE += bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x04f88000 --second_offset=0x00e88000 --tags_offset 0x03f88000
BOARD_BOOTIMG_HEADER_VERSION := 1

# DTBO image
TARGET_NEEDS_DTBOIMAGE := true
BOARD_CUSTOM_DTBOIMG_MK := $(COMMON_PATH)/odmdtbo/odmdtbo.mk
TARGET_DTBO_IMAGE_NAME := odmdtbo
TARGET_DTBO_IMAGE_TARGET := odmdtboimage

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_DTBOIMG_PARTITION_SIZE := 536870912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 54374940160
BOARD_VENDORIMAGE_PARTITION_SIZE := 687865856
BOARD_FLASH_BLOCK_SIZE := 4096

BOARD_ROOT_EXTRA_SYMLINKS += /vendor/etc/nvcfg:/nvcfg
BOARD_ROOT_EXTRA_SYMLINKS += /vendor/etc/nvdata:/nvdata
BOARD_ROOT_EXTRA_SYMLINKS += /vendor/etc/protect_f:/protect_f
BOARD_ROOT_EXTRA_SYMLINKS += /vendor/etc/protect_s:/protect_s

TARGET_COPY_OUT_PRODUCT := system/product
TARGET_COPY_OUT_SYSTEM_EXT := system/system_ext

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true

# Camera
MTK_CAM_DEFAULT_ZSD_ON_SUPPORT := yes

# exFAT / sdfat
TARGET_EXFAT_DRIVER := sdfat

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Binder
TARGET_USES_64_BIT_BINDER := true

# Graphics
TARGET_USES_HWC2 := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Panel vsync offsets
VSYNC_EVENT_PHASE_OFFSET_NS := 8300000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 8300000
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_UI_BLANK_UNBLANK_ON_INIT := true
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 32
TARGET_RECOVERY_UI_MARGIN_WIDTH  := 32
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/init/root/fstab.mt6797
BOARD_RAMDISK_USE_XZ := true

# Seccomp filters
BOARD_SECCOMP_POLICY += $(COMMON_PATH)/seccomp

# SELinux
# We modify several neverallows, so let the build proceed
ifneq ($(TARGET_BUILD_VARIANT),user)
SELINUX_IGNORE_NEVERALLOWS := true
endif
BOARD_SEPOLICY_VERS := $(PLATFORM_SDK_VERSION).0
# Board specific SELinux policy variable definitions
BOARD_PLAT_PUBLIC_SEPOLICY_DIR := \
    device/mediatek/wembley-sepolicy/plat_public
BOARD_PLAT_PRIVATE_SEPOLICY_DIR := \
    device/mediatek/wembley-sepolicy/plat_private
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    $(COMMON_PATH)/sepolicy/private

# Treble
BOARD_VNDK_VERSION := current

# Vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# HIDL Manifest
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(COMMON_PATH)/vendor_framework_compatibility_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE := $(COMMON_PATH)/framework_manifest.xml
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest.xml
DEVICE_MATRIX_FILE   := $(COMMON_PATH)/compatibility_matrix.xml

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/lib/libstagefright_omx.so|/system/lib/libstagefright_omx_shim.so \
    /system/lib64/libstagefright_omx.so|/system/lib64/libstagefright_omx_shim.so

# Inherit from the proprietary version
-include vendor/shift/mt6797-common/BoardConfigVendor.mk
