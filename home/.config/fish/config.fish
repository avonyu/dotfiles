export EDITOR="/usr/bin/nvim"
export UV_DEFAULT_INDEX="https://pypi.tuna.tsinghua.edu.cn/simple"
export NODE_TLS_REJECT_UNAUTHORIZED=0

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

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
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
