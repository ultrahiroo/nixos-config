#function prompt_sync () {

    #fossil_info=$( fossil info 2> /dev/null )
    #if echo $fossil_info | grep project-name > /dev/null ; then

        #project=$( echo $fossil_info | awk '{print $2}' )
        #checkout=$( echo $fossil_info | awk '{print $12}' | sed -r 's/(.{8}).{32}/\1/' )
        #date=$( echo $fossil_info | awk '{print $13, $14}' )
        #tags=$( echo $fossil_info | awk '{print $17}' )
        #local_root=$( echo $fossil_info | awk '{print $6}' | sed 's/\/$//' )
        #local=$( pwd | sed "s*${local_root}**" | sed "s/^$/\//" )
        #info=$( echo $fossil_info | awk '{print $2, $17, $12, $13, $14}' | sed -r 's/ (.{8}).{32} / \1 /' )
        #if [ -n "`fossil changes`" ] ; then

            #c1='\fr.'  # Red

        #else

            #c1='\fg.'  # Green

        #fi
        #echo "$c1${project}.${tags}$c2 ${checkout} (${date}):${local}$c1$c2 "
        #YASH_PS1R=" ${c1}||${c1} ${info}$ ${c1}||${c1} "
        #YASH_PS1R=" || ${info} || "
        #YASH_PS1R=" || $tags $checkout ||"

    #else

        #YASH_PS1R=" | | | | "

    #fi

#}

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

    # c2='\fg.'  # Green
    # if test -n "$branch" ; then
    #    YASH_PS1R="${c2}❮ $branch ❮\fd."
    # else
    #    #YASH_PS1R="${c2}❮\fd."
    #    YASH_PS1R=""
    # fi
}

PROMPT_COMMAND=("$PROMPT_COMMAND" 'prompt-sync')
#PROMPT_COMMAND=("$PROMPT_COMMAND" 'starship prompt')
