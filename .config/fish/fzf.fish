# Background tones
set -l base00 '#2e3440', # Default Background
set -l base01 '#3b4252', # Lighter Background (status bars)
set -l base02 '#444c5e', # Selection Background
set -l base03 '#707d99', # Comments, Invisibles
# Foreground tones
set -l base04 '#d8dee9', # Dark Foreground (status bars)
set -l base05 '#eceff4', # Default Foreground
set -l base06 '#eceff4', # Light Foreground
set -l base07 '#eceff4', # Lightest Foreground
# Accent colors
set -l base08 '#bf616a', # Variables, XML Tags, Errors
set -l base09 '#5e81ac', # Integers, Constants
set -l base0A '#88c0d0', # Classes, Search Background
set -l base0B '#8fbcbb', # Strings, Diff Inserted
set -l base0C '#96bbe9', # Regex, Escape Chars
set -l base0D '#96e9e7', # Functions, Methods
set -l base0E '#96d6e9', # Keywords, Storage
set -l base0F '#bf616a', # Deprecated, Embedded Tags

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
