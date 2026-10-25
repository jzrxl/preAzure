if status is-interactive
    preAzure
end

# Remove welcome message
set -U fish_greeting ""

# Fish syntax highlighting (Catppuccin Mocha)
set -U fish_color_normal          cdd6f4
set -U fish_color_command         89b4fa
set -U fish_color_param           89dceb
set -U fish_color_error           f38ba8 --bold
set -U fish_color_quote           f9e2af
set -U fish_color_redirection     89dceb
set -U fish_color_end             cba6f7
set -U fish_color_operator        89dceb
set -U fish_color_escape          f38ba8
set -U fish_color_comment         6c7086 --italics
set -U fish_color_autosuggestion  6c7086
set -U fish_color_selection       b4befe --bold
set -U fish_color_cwd             89dceb
set -U fish_color_cwd_root        f38ba8
set -U fish_color_valid_path      --underline

# Aliases
alias cat='bat --style=plain'
alias catn='bat'
