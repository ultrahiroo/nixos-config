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
    if [ $? -eq 0 ] ; then
        c1='\fg.'  # Green
    else
        c1='\fr.'  # Red
    fi
    #YASH_PS1="\fb.${USER} ❯ ${PWD} ❯ ${GIT_CURRENT_BRANCH}\n${c1}❯ \fd."
    YASH_PS1="\fb.${PWD} ❯ ${GIT_CURRENT_BRANCH}\n${c1}❯ \fd."
#    c2='\fg.'  # Green
#    if test -n "$branch" ; then
#        YASH_PS1R="${c2}❮ $branch ❮\fd."
#    else
#        #YASH_PS1R="${c2}❮\fd."
#        YASH_PS1R=""
#    fi
}
PROMPT_COMMAND=("$PROMPT_COMMAND" 'prompt-sync')

#PROMPT_COMMAND=("$PROMPT_COMMAND" 'starship prompt')
