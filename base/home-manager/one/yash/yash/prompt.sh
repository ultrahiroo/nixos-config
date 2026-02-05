export GIT_CURRENT_BRANCH="$(git branch --show-current 2> /dev/null)"
export FOSSIL_CURRENT_BRANCH="$(fossil branch current 2> /dev/null)"

function prompt-sync() {
    if [ $? -eq 0 ]; then
        color_1='\fg.'  # Green
        second_line="${color_1}❯ \fd."
    else
        color_1='\fr.'  # Red
        second_line="${color_1}${$?} ❯ \fd."
    fi

    branch_info=''
    if [ "${GIT_CURRENT_BRANCH}" != '' ]; then
        branch_info=" ❯ ${GIT_CURRENT_BRANCH}"
    elif [ "${FOSSIL_CURRENT_BRANCH}" != '' ]; then
        branch_info=" ❯ ${FOSSIL_CURRENT_BRANCH}"
    fi

    host_info=''
    if [ ${SSH_TTY:='NONE'} != 'NONE' ]; then
        host_info="${USER}@${HOSTNAME} ❯ "
    fi

    directory_info="${PWD}"
    first_line="\fb.${host_info}${directory_info}${branch_info}"

    YASH_PS1="${first_line}\n${second_line}"
    YASH_PS1R=''
    YASH_PS2="${color_1}❯ \fd."
    YASH_PS2R=''
}

function prompt-sync-starship() {
    YASH_PS1="$(starship prompt)"
    YASH_PS1R=''
    YASH_PS2=''
    YASH_PS2R=''
}

PROMPT_COMMAND=("$PROMPT_COMMAND" 'prompt-sync')
