CONFIG_PATH="${XDG_CONFIG_HOME:=${HOME}/.config}/yash"

# Defalut Initialization
. --autoload --no-alias ${CONFIG_PATH}/initialization/common

# Environment
. ${CONFIG_PATH}/export.sh

# Prompt
if [ "${LANG}" != 'C' ]; then
    . ${CONFIG_PATH}/prompt.sh
fi

# Alias
. ${CONFIG_PATH}/alias.sh

# Function
. ${CONFIG_PATH}/function.sh

# Screen
sleep 0.5
clean
