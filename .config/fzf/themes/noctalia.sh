fzf_theme_opts="\
--color=bg+:#41474d
--color=bg:#101417
--color=spinner:#e0e3e8
--color=hl:#ffb4ab
--color=fg:#e0e3e8
--color=header:#ffb4ab
--color=info:#95cdf7
--color=pointer:#e0e3e8
--color=marker:#c1c7ce
--color=fg+:#e0e3e8
--color=prompt:#95cdf7
--color=hl+:#ffb4ab
--color=selected-bg:#41474d
--color=border:#41474d
--color=label:#e0e3e8"

export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:+$FZF_DEFAULT_OPTS
}$fzf_theme_opts"
