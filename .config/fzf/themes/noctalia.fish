set -l fzf_theme_opts "\
--color=bg+:#3c3836
--color=bg:#32302f
--color=spinner:#ddc7a1
--color=hl:#ea6962
--color=fg:#ddc7a1
--color=header:#ea6962
--color=info:#a9b665
--color=pointer:#ddc7a1
--color=marker:#d4be98
--color=fg+:#ddc7a1
--color=prompt:#a9b665
--color=hl+:#ea6962
--color=selected-bg:#665c54
--color=border:#504945
--color=label:#ddc7a1"

if set -q FZF_DEFAULT_OPTS[1]; and test -n "$FZF_DEFAULT_OPTS"
    set -Ux FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS
$fzf_theme_opts"
else
    set -Ux FZF_DEFAULT_OPTS "$fzf_theme_opts"
end
