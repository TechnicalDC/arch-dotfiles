set -l fzf_theme_opts "\
--color=bg+:#0a1022
--color=bg:#000000
--color=spinner:#f8f8f2
--color=hl:#f16c75
--color=fg:#ebfafa
--color=header:#f16c75
--color=info:#37f499
--color=pointer:#f8f8f2
--color=marker:#abb4da
--color=fg+:#ebfafa
--color=prompt:#37f499
--color=hl+:#f16c75
--color=selected-bg:#21222c
--color=border:#bf4f8e
--color=label:#ebfafa"

if set -q FZF_DEFAULT_OPTS[1]; and test -n "$FZF_DEFAULT_OPTS"
    set -Ux FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS
$fzf_theme_opts"
else
    set -Ux FZF_DEFAULT_OPTS "$fzf_theme_opts"
end
