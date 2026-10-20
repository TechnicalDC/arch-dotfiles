fzf_theme_opts="\
--color=bg+:#4e4539
--color=bg:#17130b
--color=spinner:#ece1d4
--color=hl:#ffb4ab
--color=fg:#ece1d4
--color=header:#ffb4ab
--color=info:#f0bf6d
--color=pointer:#ece1d4
--color=marker:#d2c5b4
--color=fg+:#ece1d4
--color=prompt:#f0bf6d
--color=hl+:#ffb4ab
--color=selected-bg:#4e4539
--color=border:#4e4539
--color=label:#ece1d4"

export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:+$FZF_DEFAULT_OPTS
}$fzf_theme_opts"
