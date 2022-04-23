source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '

#コマンド履歴の前方検索を可能にする設定
stty stop undef

#コマンド履歴で保存できる最大件数
export HISTSIZE=10000
export HISTFILESIZE=10000

#grepで一致した文字列の色を変える設定
export GREP_OPTIONS='--color=always'

# gsedを有効化
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin/:$PATH"

# gawkを有効化
export PATH="/usr/local/opt/gawk/bin/:$PATH"

#locatedbを更新
alias updatedb='sudo /usr/libexec/locate.updatedb'

#lsの配色設定
if [ "$(uname)" = 'Darwin' ]; then
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ls='ls -G'
else
    eval `dircolors ~/.colorrc`
    alias ls='ls --color=auto'
fi

#pecoの設定
export HISTCONTROL="ignoredups"
peco-history() {
    local NUM=$(history | wc -l)
    local FIRST=$((-1*(NUM-1)))

    if [ $FIRST -eq 0 ] ; then
        history -d $((HISTCMD-1))
        echo "No history" >&2
        return
    fi  

    local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

    if [ -n "$CMD" ] ; then
        history -s $CMD

        if type osascript > /dev/null 2>&1 ; then
            (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
        fi  
    else
        history -d $((HISTCMD-1))
    fi  
}
bind -x '"\C-r":peco-history'
