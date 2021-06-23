#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

XDG_CONFIG_HOME="$HOME/.config"
PATH="XDG_CONFIG_HOME:/usr/local/sbin:/usr/local/bin:/usr/bin/:/opt/google/chrome:~/.npm-global/bin:~/Code/npm/hexo/node_modules/.bin:~/Code/npm/yarn/node_modules/.bin:$PATH"

source "$HOME/.vim/plugged/woohoo/woohoo_256palette.sh"

# system
alias shutdownh='sudo shutdown -h now'
alias shutdownr='sudo shutdown -r now'
alias capacity='sudo cat /sys/class/power_supply/BAT0/capacity'
alias usbflashdriveformatting='sudo mkfs.vfat -I'
alias zipqr='zip -qr'
alias prename='perl-rename -n'
alias rename='perl-rename -fv'
alias dhcpcdon='sudo systemctl start dhcpcd'
alias rm='trash'
alias bluetoothctlon='sudo bluetoothctl'
alias wifion='sudo wpa_supplicant -B -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf && sudo dhcpcd wlp3s0'

# git
alias gitadd='git add'
alias gitcommit='git commit -am'
alias gitbranch='git branch -M'
alias gitpush='git push -u origin'
alias gitdiff='git diff'
alias gitfetch='git fetch'
alias gitmerge='git merge'
alias gitclone='git clone'
alias gitforce='git checkout --orphan temp && git add . && git commit -am "Initial commit" && git branch -D main && git branch -M main && git push -f origin main'

# translate
alias trans='translate -shell en:zh'

# octave
alias octave='octave --gui'
