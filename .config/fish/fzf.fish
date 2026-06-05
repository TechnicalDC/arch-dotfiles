# Background tones
set -l base00 '#192024', # Default Background
set -l base01 '#2a363c', # Lighter Background (status bars)
set -l base02 '#263036', # Selection Background
set -l base03 '#5e6b72', # Comments, Invisibles
# Foreground tones
set -l base04 '#afb4b6', # Dark Foreground (status bars)
set -l base05 '#f2f2f3', # Default Foreground
set -l base06 '#f2f2f3', # Light Foreground
set -l base07 '#f2f2f3', # Lightest Foreground
# Accent colors
set -l base08 '#fd4663', # Variables, XML Tags, Errors
set -l base09 '#70cc66', # Integers, Constants
set -l base0A '#5c6ad6', # Classes, Search Background
set -l base0B '#67b8e4', # Strings, Diff Inserted
set -l base0C '#9ee996', # Regex, Escape Chars
set -l base0D '#93ccec', # Functions, Methods
set -l base0E '#969fe9', # Keywords, Storage
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
