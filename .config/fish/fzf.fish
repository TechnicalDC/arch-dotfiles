# Background tones
set -l base00 '#161616', # Default Background
set -l base01 '#262626', # Lighter Background (status bars)
set -l base02 '#303030', # Selection Background
set -l base03 '#636363', # Comments, Invisibles
# Foreground tones
set -l base04 '#dde1e6', # Dark Foreground (status bars)
set -l base05 '#f2f4f8', # Default Foreground
set -l base06 '#f2f4f8', # Light Foreground
set -l base07 '#f2f4f8', # Lightest Foreground
# Accent colors
set -l base08 '#ee5396', # Variables, XML Tags, Errors
set -l base09 '#be95ff', # Integers, Constants
set -l base0A '#42be65', # Classes, Search Background
set -l base0B '#33b1ff', # Strings, Diff Inserted
set -l base0C '#b180ff', # Regex, Escape Chars
set -l base0D '#80ceff', # Functions, Methods
set -l base0E '#96e9ad', # Keywords, Storage
set -l base0F '#ee5396', # Deprecated, Embedded Tags

set --export FZF_DEFAULT_OPTS " --color=bg+:$base00,spinner:$base0C,hl:$base0D"\
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
