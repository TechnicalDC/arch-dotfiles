# Background tones
set -l base00 '#1a231f', # Default Background
set -l base01 '#2c3a34', # Lighter Background (status bars)
set -l base02 '#28342f', # Selection Background
set -l base03 '#5b6f67', # Comments, Invisibles
# Foreground tones
set -l base04 '#afb6b3', # Dark Foreground (status bars)
set -l base05 '#f2f3f2', # Default Foreground
set -l base06 '#f2f3f2', # Light Foreground
set -l base07 '#f2f3f2', # Lightest Foreground
# Accent colors
set -l base08 '#fd4663', # Variables, XML Tags, Errors
set -l base09 '#6690cc', # Integers, Constants
set -l base0A '#5ccfd6', # Classes, Search Background
set -l base0B '#67e4b1', # Strings, Diff Inserted
set -l base0C '#96b8e9', # Regex, Escape Chars
set -l base0D '#93ecc7', # Functions, Methods
set -l base0E '#96e4e9', # Keywords, Storage
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
