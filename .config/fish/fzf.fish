# Background tones
set -l base00 '#1e112c', # Default Background
set -l base01 '#321d49', # Lighter Background (status bars)
set -l base02 '#2d1a42', # Selection Background
set -l base03 '#696074', # Comments, Invisibles
# Foreground tones
set -l base04 '#b2afb6', # Dark Foreground (status bars)
set -l base05 '#f2f2f3', # Default Foreground
set -l base06 '#f2f2f3', # Light Foreground
set -l base07 '#f2f2f3', # Lightest Foreground
# Accent colors
set -l base08 '#fd4663', # Variables, XML Tags, Errors
set -l base09 '#cc669c', # Integers, Constants
set -l base0A '#d25cd6', # Classes, Search Background
set -l base0B '#a167e4', # Strings, Diff Inserted
set -l base0C '#e996c2', # Regex, Escape Chars
set -l base0D '#bc93ec', # Functions, Methods
set -l base0E '#e696e9', # Keywords, Storage
set -l base0F '#fd4663', # Deprecated, Embedded Tags

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
