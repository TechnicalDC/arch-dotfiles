set -l fzf_theme_opts "\
--color=bg+:#121212
--color=bg:#111111
--color=spinner:#aaaaaa
--color=hl:#dddddd
--color=fg:#828282
--color=header:#dddddd
--color=info:#aaaaaa
--color=pointer:#aaaaaa
--color=marker:#636363
--color=fg+:#828282
--color=prompt:#aaaaaa
--color=hl+:#dddddd
--color=selected-bg:#191919
--color=border:#828282
--color=label:#828282"

if set -q FZF_DEFAULT_OPTS[1]; and test -n "$FZF_DEFAULT_OPTS"
    set -Ux FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS
$fzf_theme_opts"
else
    set -Ux FZF_DEFAULT_OPTS "$fzf_theme_opts"
end
