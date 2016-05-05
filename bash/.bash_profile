#
# ~/.bash_profile
#


export XDG_CACHE_HOME=$(readlink ~/.cache)

[[ -d $XDG_CACHE_HOME ]] || mkdir $XDG_CACHE_HOME

export PKGSHARED='/usr/share'
export USEDM='sddm'
export SYSTEM_SHARE="/usr/shared"
export USEWM='bspwm'
export WMCONFIG="/home/matt/.config/bspwm/bspwmrc"
export WMACTIONS="/home/matt/.config/sxhkd/sxhkdrc"


[[ -f ~/.bashrc ]] && . ~/.bashrc
export AUR='https://aur.archlinux.org'
export AURRPC="${AUR}/rpc.php/?v=5"

export BSPWM_SOCKET=${XDG_RUNTIME_DIR:-"/tmp"}/bspwm-abdesk-0_0-socket

export BROWSER="chromium"

