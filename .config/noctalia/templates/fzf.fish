# Background tones
set -l base00 '{{colors.surface.default.hex}}', # Default Background
set -l base01 '{{colors.surface_container.default.hex}}', # Lighter Background (status bars)
set -l base02 '{{colors.surface_container_high.default.hex}}', # Selection Background
set -l base03 '{{colors.outline.default.hex}}', # Comments, Invisibles
# Foreground tones
set -l base04 '{{colors.on_surface_variant.default.hex}}', # Dark Foreground (status bars)
set -l base05 '{{colors.on_surface.default.hex}}', # Default Foreground
set -l base06 '{{colors.on_surface.default.hex}}', # Light Foreground
set -l base07 '{{colors.on_background.default.hex}}', # Lightest Foreground
# Accent colors
set -l base08 '{{colors.error.default.hex}}', # Variables, XML Tags, Errors
set -l base09 '{{colors.tertiary.default.hex}}', # Integers, Constants
set -l base0A '{{colors.secondary.default.hex}}', # Classes, Search Background
set -l base0B '{{colors.primary.default.hex}}', # Strings, Diff Inserted
set -l base0C '{{colors.tertiary_fixed_dim.default.hex}}', # Regex, Escape Chars
set -l base0D '{{colors.primary_fixed_dim.default.hex}}', # Functions, Methods
set -l base0E '{{colors.secondary_fixed_dim.default.hex}}', # Keywords, Storage
set -l base0F '{{colors.error.default.hex}}', # Deprecated, Embedded Tags

set --export FZF_DEFAULT_OPTS " --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

set --export FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS "--layout=reverse
--border none
--prompt='> '
--pointer='>'
--marker='|'
--info=hidden
--highlight-line
--ansi"

set --export _ZO_FZF_OPTS $FZF_DEFAULT_OPTS "--layout=reverse --height 40%"
