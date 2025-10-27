#export EDITOR="/home/avon/.local/bin/lvim"
export EDITOR="/usr/bin/nvim"
export UV_DEFAULT_INDEX="https://pypi.tuna.tsinghua.edu.cn/simple"
export NODE_TLS_REJECT_UNAUTHORIZED=0

alias ls='lsd'
alias l='lsd'
alias ll='lsd -l'
alias la='lsd -la'
alias c='clear'

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# pnpm
set -gx PNPM_HOME "/home/avon/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
