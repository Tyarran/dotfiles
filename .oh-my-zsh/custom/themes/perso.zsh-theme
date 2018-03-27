function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

function prompt_virtualenv {
    if [[ $VIRTUAL_ENV ]]; then echo %{$fg_bold[red]%}"["$(basename $VIRTUAL_ENV)"] "; echo ""; fi
}

PROMPT='$(prompt_virtualenv)%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) %{$fg_bold[yellow]%}$(git_prompt_info)%_%{$fg_bold[blue]%}
$(prompt_char)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
