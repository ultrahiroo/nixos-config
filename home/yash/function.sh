# Uncomment to enable direnv support. (jq required)
#_update_direnv() {
#  eval "$(
#    direnv export json |
#    jq -r 'to_entries | .[] |
#    if .value == null then
#      @sh "unset \(.key)"
#    else
#      @sh "export \(.key)=\(.value)"
#    end'
#  )"
#}
#_update_direnv
#YASH_AFTER_CD=("$YASH_AFTER_CD" '_update_direnv')

#search() {
	#firefox --first-startup --new-tab --search $* & > /dev/null 2>&1
	#firefox --first-startup --search $* & > /dev/null 2>&1
	#firefox --new-tab --search $* & > /dev/null 2>&1
	#firefox --new-tab --search $@ & > /dev/null 2>&1
	#firefox "https://duckduckgo.com/?q=test+test&kl=jp-jp&kp=-2&ks=m&ia=web"
#}

#ipfsadd() {
#	echo >> /system/log/ipfs/ipfs-add.log
#	ipfs add -r $HOME/INoUEHiRoO/ | awk '{print $2 $3}' >> /system/log/ipfs/ipfs-add.log
#}

function after-cd() {
    #echo ${PWD}
    export GIT_CURRENT_BRANCH=$(git branch --show-current 2> /dev/null)
    #export FOSSIL_CURRENT_BRANCH=$(fossil branch current 2> /dev/null)
}
YASH_AFTER_CD=("$YASH_AFTER_CD" 'after-cd')

function remove() {
    TIMESTAMP=$(timestamp) # 'timestamp' is defined by alias.sh
    DESTINATION=${HOME}/../trash/${TIMESTAMP}
    mkdir ${DESTINATION}
    mv "$@" ${DESTINATION}
}

