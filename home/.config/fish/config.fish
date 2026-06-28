set -Ux EDITOR /opt/homebrew/bin/nvim
set -Ux fish_user_paths ~/.local/sdk/platform-tools $fish_user_paths
set -Ux fish_user_paths ~/.local/sdk/flutter/bin $fish_user_paths
set -gx tide_character_vi_icon_default "❯"
set -x HOMEBREW_API_DOMAIN "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
set -x HOMEBREW_BOTTLE_DOMAIN "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
set -x TAURI_SIGNING_PRIVATE_KEY "dW50cnVzdGVkIGNvbW1lbnQ6IHJzaWduIGVuY3J5cHRlZCBzZWNyZXQga2V5ClJXUlRZMEl5R09nYVZLbW50ZWkvUmNDM3NHb1hGM2NrczNWWFZzNGRQUmhiZEc0bGxEb0FBQkFBQUFBQUFBQUFBQUlBQUFBQVZqNS9xZkZqMjJhNE5Kb1BKaFVGT3UvazNTSUZUY2drK2JTV29Kcmc2WmFEeUJRTUFkVWtNZzYxblJuL0d4QnVkanhMVUgvaGpLNXV4SnMzUUpmaUZuSkNLNUJYbWtYVzR2bC9ReDY4Z1JTQXd6SEFlSnRzWkhrNGE0V0ZIRlR5NDc0ZWdWOCtBQ2M9Cg=="
set -x TAURI_SIGNING_PRIVATE_KEY_PASSWORD 188198

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

alias c="clear"
alias ls="lsd"
alias ll="lsd -l"
alias la="lsd -lA"
alias c-d="claude --dangerously-skip-permissions"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# pnpm
set -gx PNPM_HOME /Users/avon/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

source "$HOME/.cargo/env.fish"
