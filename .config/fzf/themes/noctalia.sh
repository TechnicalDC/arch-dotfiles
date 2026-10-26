fzf_theme_opts="\
--color=bg+:#1e1f25
--color=bg:#121318
--color=spinner:#e3e2e9
--color=hl:#ffb4ab
--color=fg:#e3e2e9
--color=header:#ffb4ab
--color=info:#b2c5ff
--color=pointer:#e3e2e9
--color=marker:#c5c6d0
--color=fg+:#e3e2e9
--color=prompt:#b2c5ff
--color=hl+:#ffb4ab
--color=selected-bg:#45464f
--color=border:#45464f
--color=label:#e3e2e9"

export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:+$FZF_DEFAULT_OPTS
}$fzf_theme_opts"
