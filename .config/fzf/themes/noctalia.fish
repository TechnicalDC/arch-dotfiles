set -l fzf_theme_opts "\
--color=bg+:#414942
--color=bg:#0f1511
--color=spinner:#dfe4dd
--color=hl:#ffb4ab
--color=fg:#dfe4dd
--color=header:#ffb4ab
--color=info:#95d5a8
--color=pointer:#dfe4dd
--color=marker:#c0c9bf
--color=fg+:#dfe4dd
--color=prompt:#95d5a8
--color=hl+:#ffb4ab
--color=selected-bg:#414942
--color=border:#414942
--color=label:#dfe4dd"

if set -q FZF_DEFAULT_OPTS[1]; and test -n "$FZF_DEFAULT_OPTS"
    set -Ux FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS
$fzf_theme_opts"
else
    set -Ux FZF_DEFAULT_OPTS "$fzf_theme_opts"
end
