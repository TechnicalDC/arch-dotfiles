# Background tones
set -l base00 '#1e2127', # Default Background
set -l base01 '#282c34', # Lighter Background (status bars)
set -l base02 '#313640', # Selection Background
set -l base03 '#616b7f', # Comments, Invisibles
# Foreground tones
set -l base04 '#61afef', # Dark Foreground (status bars)
set -l base05 '#cdd4e1', # Default Foreground
set -l base06 '#cdd4e1', # Light Foreground
set -l base07 '#cdd4e1', # Lightest Foreground
# Accent colors
set -l base08 '#e06c75', # Variables, XML Tags, Errors
set -l base09 '#98c379', # Integers, Constants
set -l base0A '#c678dd', # Classes, Search Background
set -l base0B '#61afef', # Strings, Diff Inserted
set -l base0C '#b9e996', # Regex, Escape Chars
set -l base0D '#8bc4f3', # Functions, Methods
set -l base0E '#d696e9', # Keywords, Storage
set -l base0F '#e06c75', # Deprecated, Embedded Tags

set --export FZF_DEFAULT_OPTS " --color=bg+:$base00,bg:$base00,spinner:$base0C,hl:$base0D"\
" --color=fg:$base05,header:$base0D,info:$base0A,pointer:$base0C,label:$base08"\
" --color=marker:$base0C,fg+:$base04,prompt:$base08,hl+:$base0D,border:$base03"

set --export FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS "--layout=reverse
--border none
--prompt='> '
--pointer='>'
--marker='|'
--info=hidden
--highlight-line
--ansi"

set --export _ZO_FZF_OPTS $FZF_DEFAULT_OPTS "--layout=reverse --height 40%"
