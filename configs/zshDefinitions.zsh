#ZSH_THEME_GIT_PROMPT_SHA_BEFORE
#ZSH_THEME_GIT_PROMPT_SHA_AFTER

ZSH_THEME_GIT_PROMPT_STASHED="STASHED"
ZSH_THEME_GIT_PROMPT_UNMERGED="Unmerged"

# For git_prompt_info. This says the branch and has a green tick if it is clean.
# Not defining for dirty state as that lacks precision
	ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[magenta]%}⎇ "
		ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"
		ZSH_THEME_GIT_PROMPT_DIRTY=""
	ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# State of the repo.
# Used in git_prompt_status
	ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[blue]%}?%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}✙%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}✘%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}Δ%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_RENAMED="Renamed%{$reset_color%}"

# Comparing against remote
	ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED=1
	ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX=" %{$BG[008]%}%{$FG[013]%}☁ "
		ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR="%{$BG[052]%}" # Redshift
		ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" ⇑ "

		ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR="%{$BG[053]%}" # Blueshift
		ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=" ⇓ "

		ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE_COLOR="%{$BG[022]%}"
		ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE=" ≈ "

	ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX="%{$reset_color%}"
