LOCAL_PATH:= $(call my-dir)

# ======================= STATIC LIBRARY ==========================
# This is being built because it make Oboe testing very easy with a complete executable.
# TODO Remove this target later, when not needed.
include $(CLEAR_VARS)

LOCAL_MODULE := liboboe
LOCAL_MODULE_TAGS := optional

LIBOBOE_DIR := $(TOP)/frameworks/av/media/liboboe
LIBOBOE_SRC_DIR := $(LIBOBOE_DIR)/src

LOCAL_C_INCLUDES := \
    $(call include-path-for, audio-utils) \
    frameworks/native/include \
    system/core/base/include \
    frameworks/native/media/liboboe/include/include \
    frameworks/av/media/liboboe/include \
    frameworks/native/include \
    $(LOCAL_PATH) \
    $(LOCAL_PATH)/binding \
    $(LOCAL_PATH)/client \
    $(LOCAL_PATH)/core \
    $(LOCAL_PATH)/fifo \
    $(LOCAL_PATH)/legacy \
    $(LOCAL_PATH)/utility

LOCAL_SRC_FILES = \
    core/AudioStream.cpp \
    core/AudioStreamBuilder.cpp \
    core/OboeAudio.cpp \
    legacy/AudioStreamRecord.cpp \
    legacy/AudioStreamTrack.cpp \
    utility/HandleTracker.cpp \
    utility/OboeUtilities.cpp \
    fifo/FifoBuffer.cpp \
    fifo/FifoControllerBase.cpp \
    client/AudioEndpoint.cpp \
    client/AudioStreamInternal.cpp \
    client/IsochronousClockModel.cpp \
    binding/SharedMemoryParcelable.cpp \
    binding/SharedRegionParcelable.cpp \
    binding/RingBufferParcelable.cpp \
    binding/AudioEndpointParcelable.cpp \
    binding/OboeStreamRequest.cpp \
    binding/OboeStreamConfiguration.cpp \
    binding/IOboeAudioService.cpp

LOCAL_CFLAGS += -Wno-unused-parameter -Wall -Werror

# By default, all symbols are hidden.
# LOCAL_CFLAGS += -fvisibility=hidden
# OBOE_API is used to explicitly export a function or a variable as a visible symbol.
LOCAL_CFLAGS += -DOBOE_API='__attribute__((visibility("default")))'

include $(BUILD_STATIC_LIBRARY)

# ======================= SHARED LIBRARY ==========================
include $(CLEAR_VARS)

LOCAL_MODULE := liboboe
LOCAL_MODULE_TAGS := optional

LOCAL_C_INCLUDES := \
    $(call include-path-for, audio-utils) \
    frameworks/native/include \
    system/core/base/include \
    frameworks/native/media/liboboe/include/include \
    frameworks/av/media/liboboe/include \
    $(LOCAL_PATH) \
    $(LOCAL_PATH)/binding \
    $(LOCAL_PATH)/client \
    $(LOCAL_PATH)/core \
    $(LOCAL_PATH)/fifo \
    $(LOCAL_PATH)/legacy \
    $(LOCAL_PATH)/utility

LOCAL_SRC_FILES = core/AudioStream.cpp \
    core/AudioStreamBuilder.cpp \
    core/OboeAudio.cpp \
    legacy/AudioStreamRecord.cpp \
    legacy/AudioStreamTrack.cpp \
    utility/HandleTracker.cpp \
    utility/OboeUtilities.cpp \
    fifo/FifoBuffer.cpp \
    fifo/FifoControllerBase.cpp \
    client/AudioEndpoint.cpp \
    client/AudioStreamInternal.cpp \
    client/IsochronousClockModel.cpp \
    binding/SharedMemoryParcelable.cpp \
    binding/SharedRegionParcelable.cpp \
    binding/RingBufferParcelable.cpp \
    binding/AudioEndpointParcelable.cpp \
    binding/OboeStreamRequest.cpp \
    binding/OboeStreamConfiguration.cpp \
    binding/IOboeAudioService.cpp

LOCAL_CFLAGS += -Wno-unused-parameter -Wall -Werror

# By default, all symbols are hidden.
# LOCAL_CFLAGS += -fvisibility=hidden
# OBOE_API is used to explicitly export a function or a variable as a visible symbol.
LOCAL_CFLAGS += -DOBOE_API='__attribute__((visibility("default")))'

LOCAL_SHARED_LIBRARIES := libaudioclient liblog libcutils libutils libbinder

include $(BUILD_SHARED_LIBRARY)