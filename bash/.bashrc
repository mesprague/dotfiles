#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EMAIL="mesprague@gmail.com"
export M2DESKTOPS=("Home" "Apps" "Desk" "Workspace")
export M1DESKTOPS=("Aux" "Aux2" "Utils"  "System")

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}


println() {
    printf "%s\n" $@
}

add2file() {
	printf "%s\n" $1 >> $2
}

pkgman-install() {

    if [ $# -eq 0 ]
    then
        pacman -Sh
    else
        pacman -S "$@"
    fi

    printf "Transaction completed"
}


pkgman-search() {

    if [ $# -eq 0 ]
    then
        pacman -Ssh
    else
        sudo pacman -Ss "$@"
    fi
}




alias grep='grep -n --color=auto'
alias ls='ls --color=auto'
alias bspwm-cfg="${EDITOR:-"nano -wDu"}  ${WMCONFIG}"
alias bspwm-xk="${EDITOR:-"nano -wDu"}  ${WMACTIONS}"


bspwm-status(){
    status=$(bspc wm -g)
    
}


#declare -A statusCodes
#statusCodes["f"]="Unfocused"



bspwmctl() {

    

    print_usage() {
        println "bspwmctl : control utilty for bspwm"
        println "usage: bspwmctl [FLAGS] COMMAND [ARGS]"
        println ":flags:\n\t--verbose\n\t--help\n\t--json"
        println "Commands:\nstatus : print session status"
        println "\tlist-windows\n\tlist-monitors\n\tlist-desktop"
        println "\tclose-\n\tview-log\n\t"
    }


    print_status(){
        println "Not Implemented"
        bspc wm -g
    }

} 


PS1='[\u@\h \W]\$ '
PS2='> '
PS3='> '
PS4='+ '

export AURTOOL="aur.sh"

alias pacupgrade='pacman --noconfirm --noprogressbar --needed  -Syu'
alias aurupgrade='pacman -Qqm | xargs bash <(curl aur.sh) -si --needed'

aurman() {
    pushd ~/build/
    ~/scripts/aur.sh -si $1
    popd
}

export PENGUIN="🐧"
export PAWS="🐾"
export DOG_FACE="🐶 "
export DOG="🐕"e
export REFRESH="🔃" 
export AUR='https://aur.archlinux.org'
export AURRPC="${AUR}/rpc.php/?v=5"

export EDITOR='nano'
export VISUAL='subl3'


switch_window(){
    bspc node   -f next
}


switch_desktop(){
    bspc desktop -f next
}


aursearch(){
    curl -G -d type=search -d arg="${1}" "${AURRPC}" | jq
}
