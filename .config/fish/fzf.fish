# Background tones
set -l base00 '#212337', # Default Background
set -l base01 '#292e42', # Lighter Background (status bars)
set -l base02 '#31374f', # Selection Background
set -l base03 '#606b9d', # Comments, Invisibles
# Foreground tones
set -l base04 '#abb4da', # Dark Foreground (status bars)
set -l base05 '#ebfafa', # Default Foreground
set -l base06 '#ebfafa', # Light Foreground
set -l base07 '#ebfafa', # Lightest Foreground
# Accent colors
set -l base08 '#f16c75', # Variables, XML Tags, Errors
set -l base09 '#a48cf2', # Integers, Constants
set -l base0A '#04d1f9', # Classes, Search Background
set -l base0B '#37f499', # Strings, Diff Inserted
set -l base0C '#a48cf2', # Regex, Escape Chars
set -l base0D '#86f8c1', # Functions, Methods
set -l base0E '#82e9fd', # Keywords, Storage
set -l base0F '#f16c75', # Deprecated, Embedded Tags

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
