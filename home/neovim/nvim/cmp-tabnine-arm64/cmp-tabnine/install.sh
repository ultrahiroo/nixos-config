#!/usr/bin/env bash

# Based on https://github.com/codota/TabNine/blob/master/dl_binaries.sh
# Download latest TabNine binaries
set -o errexit
set -o pipefail
set -x

version=${version:-$(curl -sS https://update.tabnine.com/bundles/version)}

case $(uname -s) in
"Darwin")
    if [ "$(uname -m)" == "arm64" ]; then
        platform="aarch64-apple-darwin"
    else
        platform="$(uname -m)-apple-darwin"
    fi
    ;;
"Linux")
    platform="$(uname -m)-unknown-linux-musl"
    ;;
esac

# we want the binary to reside inside our plugin's dir
cd $(dirname $0)
path=$version/$platform

if [ "$(uname -s)" == 'Linux' ] && [ "$(uname -m)" == 'aarch64' ]; then
    platform_emulation='x86_64-unknown-linux-musl'
    path_emulation="${version}/${platform_emulation}"
    curl https://update.tabnine.com/bundles/${path_emulation}/TabNine.zip --create-dirs -o binaries/${path}/TabNine.zip
else
    curl https://update.tabnine.com/bundles/${path}/TabNine.zip --create-dirs -o binaries/${path}/TabNine.zip
fi
unzip -o binaries/${path}/TabNine.zip -d binaries/${path}
rm -rf binaries/${path}/TabNine.zip
chmod +x binaries/$path/*
