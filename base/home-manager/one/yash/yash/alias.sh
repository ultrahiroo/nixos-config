alias b='${BROWSER} &'
alias browse='${BROWSER} &'
alias e='${EDITOR}'
alias edit='${EDITOR}'
alias page='${PAGER}'
alias pager='${PAGER}'
alias t='${TERMINAL}'
alias terminal='${TERMINAL}'

alias mkcd='
    function _mkcd(){
        mkdir ${1}
        cd ${1}
    }
    _mkcd'

alias df='df --human-readable'
alias df-btrfs='sudo btrfs filesystem usage -T'
alias du='
    function _du(){
        if test ${#} -eq 1; then
            TARGET=${1}
        else
            TARGET='.'
        fi
        du -b -d 1 "${TARGET}" | sort -g -r | numfmt --to=iec-i | column -t
    }
    _du'
alias du-btrfs='sudo btrfs filesystem du --summarize'

alias clang-as='clang -S'
alias clang-ll='clang -S -emit-llvm'
alias clang-ast_json='clang -Xclang -ast-dump=json -fsyntax-only'
alias cp-backup='cp --backup=numbered'
alias cp-reflink='cp --reflink=always'
alias diff='diff -upNr --color=auto'
alias diffstat='diffstat -C'
alias fd='fd --no-ignore --hidden'
alias gcc-sve='gcc -march=armv8-a+sve'
alias git-init-bare='git init --initial-branch main --bare'
alias git-patch-origin='git format-patch origin'
alias git-status='git status'
alias glxgears='vblank_mode=0 glxgears'

# alias ls-gnu='/bin/ls'
# --icons=always
alias l='eza'
alias ls='eza --classify=always --group-directories-first --sort=Name'
alias la='eza --classify=always --group-directories-first --sort=Name --all --long'
alias ll='eza --classify=always --group-directories-first --sort=Name --all --long --git'
alias tree='eza --classify=always --tree --git-ignore'

alias llc-as='llc -filetype=asm'
alias llc-obj='llc -filetype=obj'
alias mix='alsamixer'
alias mount='sudo mount'
alias neovim='nvim'
alias opt-ll='opt -S'
alias package='sudo apt'
alias apt-add='sudo apt install'
alias apt-delete='sudo apt remove'
alias apt-depend='apt depends'
alias apt-fix='sudo apt install --fix-broken --fix-missing'
alias apt-hide='sudo apt-mark auto'
alias apt-hide-orphan='sudo apt-mark auto $(deborphan)'
alias apt-hold='sudo apt-mark hold'
alias apt-info='apt show'
alias apt-install='sudo apt install'
alias apt-install-auto='sudo apt install --mark-auto'
alias apt-install-build-dependency='sudo apt build-dep'
alias apt-install-build-dependency-auto='sudo apt build-dep --mark-auto'
alias apt-install-experimental='sudo apt install -t experimental'
alias apt-list='apt list --installed | pager'
alias apt-minus='sudo apt purge'
alias apt-plus='sudo apt install'
alias apt-purge-old-setting='sudo apt purge "~c"'
alias apt-reinstall='sudo apt reinstall'
alias apt-remove='sudo apt purge'
alias apt-remove-old-config='for var in $(dpkg --list | grep "^rc" | cut -d " " -f 3); do sudo dpkg --purge ${var}; done'
alias apt-reverse-depend='apt rdepends'
alias apt-depend-recursive='apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances openjdk-18-jdk | grep "^\w" | sort -u'
alias apt-recommend-recursive='apt-cache depends --recurse --no-depends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances openjdk-18-jdk | grep "^\w" | sort -u'
alias apt-search='apt search'
#alias apt-show='apt show'
alias apt-show='sudo apt-mark manual'
# alias apt-sync='sudo apt update -y && sudo apt full-upgrade --allow-downgrades && sudo apt autopurge -y && sudo apt clean -y'
alias apt-sync='sudo apt update -y && sudo apt upgrade -y && sudo apt autopurge -y && sudo apt clean -y'
alias apt-tree='dpkg --listfiles'
alias apt-unhide='sudo apt-mark manual'
alias apt-uninstall='sudo apt purge'
alias apt-update='sudo apt upgrade'
alias apt-update-index='sudo apt update'
alias apt-update-list='apt list --upgradable'
alias apt-upgrade='sudo apt update -y && sudo apt full-upgrade -y && sudo apt autopurge -y && sudo apt clean -y'
alias apt-world='apt-mark showmanual'
alias apt-world-minimize='apt-mark minimize-manual'

alias pip-clean='pip cache purge'
alias pip-install='pip install'
alias pip-install-dot='pip install .'
alias pip-upgrade='pip install --upgrade'
alias pip-world='pip list --user'
alias port-list='sudo ss -ltunp'
alias py='python'
alias pyt='pytest'
# alias pyt='pytest --verbose --verbosity=3 --capture=tee-sys --last-failed --assert=plain -r a --maxfail=1'
# alias pytest='pytest --verbose --verbosity=3 --capture=tee-sys --last-failed --assert=plain -r a'
alias remake='make --always-make'
alias remove-broken-symlink='find . -xtype l -delete'
alias service='sudo systemctl'
alias service-user='systemctl --user'
alias sh='yash -o posixlycorrect'
alias source='.'
alias status='echo $?'
alias strace-log='strace -t -o log.strace'
alias timestamp='date "+%Y-%m-%dT%H:%M:%S"'
alias top='btop'
alias unmount='sudo umount'
alias which='command -v'
alias json-to-yaml='yq e -P'
alias yaml-to-json='yq e -j'
alias vscode='code'

#alias lsport='sudo lsof -i'
#sudo journalctl --vacuum-files=1
#journalctl --disk-usage
#npm cargo pip go gem
#alias file-count='find . -type f | wc -l'
#alias nextcloud-sync='nextcloudcmd -u one -p 235711131719 /user/one/home/nextcloud http://localhost/nextcloud > /dev/null'
#alias ipfs='sudo IPFS_PATH=/user/one/home/ipfs /user/one/cache/go/bin/ipfs'

function apt-hide-install {
    sudo apt install "${@}"
    sudo apt-mark auto "${@}"
}

alias alsa-midi-sequencer='aseqdump --port=$(aseqdump --list | grep "CASIO USB-MIDI" | sed -r "s|^ +||" | cut -d " " -f 1)'
alias cargo-world="cargo install --list | grep -e '^    ' | tr -d ' '"
alias go-world='ls -1 ${GOPATH}/bin'
alias npm-world='npm --global --depth=0 list'
alias caddy-reload='sudo caddy reload --config /user/one/setting/caddy/Caddyfile'
# apt-cache showsrc wine | grep 'Build'

alias rg='rg --no-ignore --hidden'

alias kde-image-veiwer='gwenview'
alias kde-file-manager='dolphin'

alias nix-env-install='nix-env --install'
alias nix-env-uninstall='nix-env --uninstall'
alias nix-env-world='nix-env --query'
alias nix-env-search='nix-env --query --available'
alias nix-env-clean='nix-env --delete-generations old && nix-store --gc'
alias nix-env-upgrade='nix-env --upgrade'
# alias nix-env-upgrade-nix='nix-channel --update && nix-env --install --attr nixpkgs.nix nixpkgs.cacert && sudo systemctl daemon-reload && sudo systemctl restart nix-daemon'

alias nix-upgrade-nix='nix upgrade-nix' 
alias nix-channel-update='nix-channel --update'
alias nix-channel-list='nix-channel --list'

alias nix-profile-install='nix profile install'
alias nix-profile-uninstall='nix profile remove'
alias nix-profile-search='nix search nixpkgs'
alias nix-profile-world='nix profile list'
alias nix-profile-upgrade='nix profile upgrade'
alias nix-profile-upgrade-all="nix profile upgrade '.*'"
alias nix-profile-clean='nix store gc'
alias nix-repl-flake='nix repl --expr "builtins.getFlake \"$PWD\""'

alias nvtop='LINES= nvtop'
alias gparted='sudo -EH gparted'
alias kde-partition-manager='sudo partitionmanager'
alias compsize='sudo compsize'
alias reboot='systemctl reboot --no-wall'

alias pulseaudio-control='pavucontrol'
alias pipewire-control='qpwgraph'
alias android-reverse-tethering='sudo gnirehtet'
alias iotop='LINES= iotop'
