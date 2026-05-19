# Background tones
set -l base00 '#1c1e21', # Default Background
set -l base01 '#2f3237', # Lighter Background (status bars)
set -l base02 '#2a2d32', # Selection Background
set -l base03 '#66686f', # Comments, Invisibles
# Foreground tones
set -l base04 '#b0b2b5', # Dark Foreground (status bars)
set -l base05 '#f2f2f3', # Default Foreground
set -l base06 '#f2f2f3', # Light Foreground
set -l base07 '#f2f2f3', # Lightest Foreground
# Accent colors
set -l base08 '#fd4663', # Variables, XML Tags, Errors
set -l base09 '#9391a1', # Integers, Constants
set -l base0A '#9192a1', # Classes, Search Background
set -l base0B '#9ea3ad', # Strings, Diff Inserted
set -l base0C '#bcbac4', # Regex, Escape Chars
set -l base0D '#babdc5', # Functions, Methods
set -l base0E '#babbc4', # Keywords, Storage
set -l base0F '#fd4663', # Deprecated, Embedded Tags

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

set --export _ZO_FZF_OPTS $FZF_DEFAULT_OPTS
