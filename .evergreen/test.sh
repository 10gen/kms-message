#!/bin/bash
# Sets up a testing environment and runs test_kms_request.
#
# Assumes the current working directory contains kms-message.
# So script should be called like: ./kms-message/.evergreen/test.sh
# The current working directory should be empty aside from 'kms-message'.
#
# Set the VALGRIND environment variable to "valgrind <opts>" to run through valgrind.
#

set -o errexit
set -o xtrace

evergreen_root="$(pwd)"

. ${evergreen_root}/kms-message/.evergreen/setup-env.sh

BIN_DIR=./cmake-build
if [ "Windows_NT" == "$OS" ]; then
    BIN_DIR=./cmake-build/Debug
fi

echo "Running tests."
cd kms-message
$VALGRIND ${BIN_DIR}/test_kms_request
cd ..
