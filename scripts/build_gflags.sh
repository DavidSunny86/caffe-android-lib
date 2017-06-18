#!/usr/bin/env bash

set -eu

# shellcheck source=/dev/null
. "$(dirname "$0")/../config.sh"

GFLAGS_ROOT=${PROJECT_DIR}/gflags
BUILD_DIR=${GFLAGS_ROOT}/build
INSTALL_DIR=${PROJECT_DIR}/android_lib/gflags

rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}"
pushd "${BUILD_DIR}"

cmake -DCMAKE_TOOLCHAIN_FILE="${PROJECT_DIR}/android-cmake/android.toolchain.cmake" \
      -DANDROID_NDK="${NDK_ROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
      -DANDROID_ABI="${ANDROID_ABI}" \
      -DANDROID_NATIVE_API_LEVEL=21 \
      -DCMAKE_INSTALL_PREFIX="${INSTALL_DIR}" \
      ..

make -j"${N_JOBS}"
rm -rf "${INSTALL_DIR}"
make install/strip
git clean -fd

popd
