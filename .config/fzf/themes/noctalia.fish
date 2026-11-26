set -l fzf_theme_opts "\
--color=bg+:#171717
--color=bg:#000000
--color=spinner:#f2f4f8
--color=hl:#ee5396
--color=fg:#f2f4f8
--color=header:#ee5396
--color=info:#33b1ff
--color=pointer:#f2f4f8
--color=marker:#dde1e6
--color=fg+:#f2f4f8
--color=prompt:#33b1ff
--color=hl+:#ee5396
--color=selected-bg:#262626
--color=border:#f2f4f8
--color=label:#f2f4f8"

if set -q FZF_DEFAULT_OPTS[1]; and test -n "$FZF_DEFAULT_OPTS"
    set -Ux FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS
$fzf_theme_opts"
else
    set -Ux FZF_DEFAULT_OPTS "$fzf_theme_opts"
end
