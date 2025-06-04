#!/bin/sh

if test "${__HM_SESS_VARS_SOURCED:=0}" -eq '0'; then
    SOURCE="${HOME}/.local/state/nix/profiles/home-manager/home-path/etc/profile.d/hm-session-vars.sh"
    if test ! -e "${SOURCE}"; then
        echo "'hm-session-vars.sh' is not found"
        exit 1
    fi

    TEMP=$(mktemp)
    tail -n +3 "${SOURCE}" >> "${TEMP}"

    . "${TEMP}"

    rm -f "${TEMP}"
fi
