source ~/.bashrc

export PATH="$HOME/.pyenv/shims:$PATH:~/bin"
export PATH=/usr/local/Cellar/openssl/1.1.1d/bin:$PATH
# Goの設定
export PATH="/usr/local/go/bin:$PATH"
GOPATH="$HOME/go"
export GOPATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=$HOME/.nodebrew/current/bin:$PATH
