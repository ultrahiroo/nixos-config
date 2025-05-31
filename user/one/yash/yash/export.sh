#USER=root
#SHLVL=1
#OLDPWD=/Users/Root
#LOGNAME=root
#SHELL=/bin/ash
#PWD=/etc

#export HOME=/
#export TERM=linux
#export PS1=%

#export PATH=
#export LD_LIBRARY_PATH=
#export MANPATH=
#export INFOPATH=

# export HOSTNAME="$(uname -n)"
export LINES='25'

JOB="$(($(nproc) - 1))"
export MAKEFLAGS="-j ${JOB} -l 0.7"
export CMAKE_BUILD_PARALLEL_LEVEL="${JOB}"

#export CC=musl-gcc
#export HOSTCC=musl-gcc
#export C_INCLUDE_PATH=
#export PKG_CONFIG_PATH=
#export ROOT=${HOME}/targetfs
#export TARGET="aarch64-unknown-linux-gnu"
#export CC="${TARGET}-gcc --sysroot=${ROOT}"
#export CXX="${TARGET}-g++ --sysroot=${ROOT}"
#export AR="${TARGET}-ar"
#export AS="${TARGET}-as"
#export LD="${TARGET}-ld --sysroot=${ROOT}"
#export RANLIB="${TARGET}-ranlib"
#export READELF="${TARGET}-readelf"
#export STRIP="${TARGET}-strip"
#export LC_ALL=C
#export AR=llvm-ar
#export ARCH="arm64"
##export CROSS_COMPILE="aarch64-unknown-linux-gnu-"
#export CC="clang"
#export CXX="clang++"
#export HOSTAR=llvm-ar
#export HOSTCC=clang
#export HOSTCXX=clang++
#export HOSTLD=ld.lld
#export LD="ld.lld"
#export LLVM=1
#export LLVM_IAS=1
#export NM=llvm-nm
#export OBJCOPY=llvm-objcopy
#export OBJDUMP=llvm-objdump
#export OBHSIZE=llvm-objsize
#export READELF=llvm-readelf
#export STRIP=llvm-strip
# export GRADLE_OPTS=''

if echo "$(tty)" | grep 'tty' > /dev/null; then
    export LANG='C'
else
    export LANG='ja_JP.UTF-8'
fi

# INPUT_METHOD='fcitx'
# export GTK_IM_MODULE="${INPUT_METHOD}"
# export QT_IM_MODULE="${INPUT_METHOD}"
# export XMODIFIERS="@im=${INPUT_METHOD}"
# export GLFW_IM_MODULE="${INPUT_METHOD}"

# export $(dbus-launch)

#export QT_QPA_PLATFORM=linuxfb
#export QT_QPA_PLATFORM=linuxfb:fb=/dev/fb0:rotation=90
#export QT_QPA_FB_DRM=1

#export QT_QPA_PLATFORM=eglfs
#export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
#export QT_QPA_EGLFS_ROTATION=90

#export QTWEBENGINE_DISABLE_SANDBOX=1 # to be launched by root user
export GIT_DISCOVERY_ACROSS_FILESYSTEM='1' # Git on Btrfs
#export LIBGL_ALWAYS_SOFTWARE=1 # Kitty, Servo

# if test "${XDG_SESSION_TYPE}" = 'wayland'; then
#     export MOZ_ENABLE_WAYLAND='1'  # Firefox
#     export QT_QPA_PLATFORM='wayland'
#     # export QT_WAYLAND_DISABLE_WINDOWDECORATION='1' # Sway
#     export _JAVA_AWT_WM_NONREPARENTING='1'  # https://github.com/swaywm/sway/issues/595
# fi

# export BROWSER='firefox'
export EDITOR='nvim'
# export EDITOR='micro'
# export PAGER='bat'

#export PATH=$HOME/bin:$PATH
#export PATH=/usr/bin:$PATH
#export PATH=/usr/local/bin:$PATH
#export PATH=/opt/vc/bin:$PATH
#export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/

# export SETTING="/user/${USER}/setting"
# export CACHE="/user/${USER}/cache"

# export XDG_CACHE_HOME="${CACHE}"
# export XDG_CONFIG_HOME="${CACHE}"
# export XDG_DATA_HOME="${CACHE}"
# export XDG_DATA_DIRS='/usr/share'

# export XDG_DESKTOP_DIR="${HOME}/Desktop"
# export XDG_DOCUMENTS_DIR="${HOME}/Documents"
# export XDG_DOWNLOAD_DIR="${HOME}/Downloads"
# export XDG_MUSIC_DIR="${HOME}/Music"
# export XDG_PICTURES_DIR="${HOME}/Pictures"
# export XDG_PUBLICSHARE_DIR="${HOME}/Public"
# export XDG_TEMPLATES_DIR="${HOME}/.Templates"
# export XDG_VIDEOS_DIR="${HOME}/Videos"

# export GNUPGHOME="${CACHE}/gnupg"
# export GOPATH="${CACHE}/go"
# export MPLAYER_HOME="${CACHE}/mplayer"
# export XAUTHORITY="${CACHE}/xorg/Xauthority"
# export RUSTUP_HOME="${CACHE}/rustup"
# export CARGO_HOME="${CACHE}/cargo"
# export SCCACHE_DIR="$CACHE/sccache"
# export SCCACHE_CACHE_SIZE='4G'
# export NPM_CONFIG_PREFIX="${CACHE}/npm"
# export NPM_CONFIG_USERCONFIG="${CACHE}/npm/npmrc"
# export DENO_INSTALL=$HOME/.deno
# export PATH=$DENO_INSTALL/bin:$PATH
# export FOSSIL_HOME="${CACHE}/fossil"
# export FOSSIL_USER='one'
# export PERL5LIB="${CACHE}/perl"
# export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD='true'
# export PUPPETEER_EXECUTABLE_PATH="$(command -v chromium)"
# export PYTHONUSERBASE="${CACHE}/python"
# export IPFS_PATH="${CACHE}/ipfs"
# export GITEA_WORK_DIR="${CACHE}/gitea"
# export TESSDATA_PREFIX="${CACHE}/tessdata-legacy"  # Audiveris
# export MODULAR_HOME="${CACHE}/modular"

# if test -z "${SHLVL}" -o "${SHLVL}" = '1'; then
#     export PATH=$CACHE/python/bin:$PATH
#     export PATH=$GOPATH/bin:$PATH
#     export PATH=$NPM_CONFIG_PREFIX/bin:$PATH
#     export PATH=$CARGO_HOME/bin:$PATH
#     export PATH=${CACHE}/bin:$PATH
#     export PATH=/opt/arm/arm-instruction-emulator-21.0_Generic-AArch64_Ubuntu-18.04_aarch64-linux/bin64:$PATH
    # export PYTHONPATH=$CACHE/python/lib/python3.9/site-packages
    # export PYTHONPATH=$CACHE/apostrophe/lib/python3.9/site-packages:$PYTHONPATH
    # export PYTHONPATH=/user/one/home/miniforge3:$PYTHONPATH
    # export PYTHONPATH=${CACHE}/GIMP/2.10/plug-ins/gimpfu:${PYTHONPATH}
    # export PATH="/user/one/home/miniforge3/bin:${PATH}"
#     export PATH="${MODULAR_HOME}/pkg/packages.modular.com_mojo/bin:${PATH}"
#     # MAX_PATH="$(modular config max.path)"
#     # export PATH="${MAX_PATH}/bin:${PATH}"
# fi

#export XKB_DEFAULT_RULES=''
#export XKB_DEFAULT_MODEL=''
#export XKB_DEFAULT_LAYOUT=''
#export XKB_DEFAULT_VARIANT='colemak'
#export XKB_DEFAULT_OPTIONS='keypad:pointerkeys'

# export CMAKE_ROOT='/usr/local/share/cmake-3.26'
# export WAYLAND_DISPLAY='wayland'

# export MYPY_CACHE_DIR='/tmp/mypy'

# export NIXPKGS_ALLOW_UNFREE=1
