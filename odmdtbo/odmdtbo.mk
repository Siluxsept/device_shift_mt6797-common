APPEND_CERTS := $(COMMON_PATH)/odmdtbo/append_certs.py
MKDTIMG := $(HOST_OUT_EXECUTABLES)/mkdtimg$(HOST_EXECUTABLE_SUFFIX)
MKDTBOIMG := $(HOST_OUT_EXECUTABLES)/mkdtboimg.py$(HOST_EXECUTABLE_SUFFIX)

$(BOARD_PREBUILT_DTBOIMAGE): $(DTC) $(MKDTIMG) $(MKDTBOIMG)
$(BOARD_PREBUILT_DTBOIMAGE):
	@echo "Building $(TARGET_DTBO_IMAGE_NAME).img"
	$(call make-dtbo-target,$(KERNEL_DEFCONFIG))
	$(call make-dtbo-target,$(TARGET_DTBO_IMAGE_TARGET))
	$(APPEND_CERTS) --alignment 16 --cert1 $(COMMON_PATH)/odmdtbo/cert1.der --cert2 $(COMMON_PATH)/odmdtbo/cert2.der --dtbo $(BOARD_PREBUILT_DTBOIMAGE)
