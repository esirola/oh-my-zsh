# -*-sh-*-
# needs mercurial plugin

dc=$HOME/.dircolors

case $(uname) in 
	Darwin)
		export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
		if [[ $(which gls) == */gls ]] && [[ -e $dc ]] && which gdircolors >/dev/null; then 
			eval "$(gdircolors $dc)"
			alias ls='gls --color=auto'
		fi
		;;
	Linux)
		[[ "$(which dircolors)" == */dircolors ]] && [[ -e $dc ]] && eval "$(dircolors $dc)"
		;;
esac

#PROMPT='%(?..%{$fg_bold[red]%}%? )%{$fg_bold[green]%}%p%{$fg[cyan]%}%4c %{$fg_bold[blue]%}$(git_prompt_info)$(hg_prompt_info)%{$fg_bold[blue]%} %(#.%{$fg_bold[red]%}.%{$fg_bold[green]%})➤%{$reset_color%} '
PROMPT='$(virtualenv_prompt_info)%(?..%{$fg_bold[red]%}%? )%{$fg_bold[green]%}%n@%m %{$fg[cyan]%}%4c %{$fg_bold[blue]%}$(git_prompt_info)$(hg_prompt_info)%{$fg_bold[blue]%} %(#.%{$fg_bold[red]%}.%{$fg_bold[green]%})➤%{$reset_color%} '
# git stuff is in the default lib
ZSH_THEME_GIT_PROMPT_PREFIX="(git: %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# mercurial prompt needs mercurial plugin
ZSH_THEME_HG_PROMPT_PREFIX="(☿: %{$fg[red]%}"
ZSH_THEME_HG_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
ZSH_THEME_HG_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_DIRTY
ZSH_THEME_HG_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN
