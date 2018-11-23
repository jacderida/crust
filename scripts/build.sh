#!/usr/bin/env bash

set -x;

if [ "${TRAVIS_OS_NAME}" == "osx" ]; then
    cargo test --release --verbose
elif [ "${TRAVIS_OS_NAME}" == "linux" ]; then
    echo $PWD
    ls -al
    version=$(cat Cargo.toml | grep "^version" | awk '{ print $3 }' | sed 's/\"//g')
    docker run --rm -v "$PWD:/usr/src/crust" maidsafe/crust:$version
fi
