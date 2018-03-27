#FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/share/fzf/key-bindings.zsh

#Powerline
powerline-daemon -q
source /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

eval `keychain --eval --agents ssh id_rsa -q`
