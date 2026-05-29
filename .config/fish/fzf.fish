# Background tones
set -l base00 '#131313', # Default Background
set -l base01 '#1f1f1f', # Lighter Background (status bars)
set -l base02 '#2a2a2a', # Selection Background
set -l base03 '#919191', # Comments, Invisibles
# Foreground tones
set -l base04 '#c6c6c6', # Dark Foreground (status bars)
set -l base05 '#e2e2e2', # Default Foreground
set -l base06 '#e2e2e2', # Light Foreground
set -l base07 '#e2e2e2', # Lightest Foreground
# Accent colors
set -l base08 '#ffb4ab', # Variables, XML Tags, Errors
set -l base09 '#e2e2e2', # Integers, Constants
set -l base0A '#c6c6c6', # Classes, Search Background
set -l base0B '#ffffff', # Strings, Diff Inserted
set -l base0C '#c6c6c6', # Regex, Escape Chars
set -l base0D '#c6c6c6', # Functions, Methods
set -l base0E '#c6c6c6', # Keywords, Storage
set -l base0F '#ffb4ab', # Deprecated, Embedded Tags

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
