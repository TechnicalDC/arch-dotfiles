set -l fzf_theme_opts "\
--color=bg+:#44474e
--color=bg:#111318
--color=spinner:#e2e2e9
--color=hl:#ffb4ab
--color=fg:#e2e2e9
--color=header:#ffb4ab
--color=info:#acc7ff
--color=pointer:#e2e2e9
--color=marker:#c4c6d0
--color=fg+:#e2e2e9
--color=prompt:#acc7ff
--color=hl+:#ffb4ab
--color=selected-bg:#44474e
--color=border:#44474e
--color=label:#e2e2e9"

if set -q FZF_DEFAULT_OPTS[1]; and test -n "$FZF_DEFAULT_OPTS"
    set -Ux FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS
$fzf_theme_opts"
else
    set -Ux FZF_DEFAULT_OPTS "$fzf_theme_opts"
end
