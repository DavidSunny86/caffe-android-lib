#!/usr/bin/env bash

PROJECT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
INSTALL_DIR=${PROJECT_DIR}/android_lib
TOOLCHAIN_DIR=${PROJECT_DIR}/toolchains
ANDROID_ABI=${ANDROID_ABI:-"arm64-v8a"}
N_JOBS=${N_JOBS:-4}
NDK_ROOT=${NDK_ROOT:-"/opt/android-ndk-r11c"}
