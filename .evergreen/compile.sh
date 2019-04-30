#!/bin/bash
# Compiles kms-message targets.
#
# Assumes the current working directory contains kms-message.
# So script should be called like: ./kms-message/.evergreen/compile.sh
# The current working directory should be empty aside from 'kms-message'
# since this script may create new directories/files.
#
# Set extra cflags for kms-message variables by setting KMS_MESSAGE_EXTRA_CFLAGS.
#

set -o xtrace
set -o errexit

echo "Begin compile process"

evergreen_root="$(pwd)"

. ${evergreen_root}/kms-message/.evergreen/setup-env.sh

cd $evergreen_root

if [ "$OS" == "Windows_NT" ]; then
    CMAKE=/cygdrive/c/cmake/bin/cmake
else
    chmod u+x ./kms-message/.evergreen/find-cmake.sh
    . ./kms-message/.evergreen/find-cmake.sh
fi

$CMAKE --version
# Build and install kms-message.
cd kms-message
mkdir cmake-build
cd cmake-build
$CMAKE -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_FLAGS="-fPIC" "-DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}/kms-message" ../
echo "Installing kms-message"
$CMAKE --build . --target install
$CMAKE --build . --target test_kms_request
cd $evergreen_root
