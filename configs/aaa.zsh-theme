function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '➤'
}

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{green}%n%f'
  PR_PROMPT='%F{green}$(prompt_char)%f'
else # root
  PR_USER='%F{red}%n%f'
  PR_PROMPT='%F{red}➤ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST='%F{green}%M%f' # no SSH
fi

#ZSH_THEME_GIT_PROMPT_SHA_BEFORE
#ZSH_THEME_GIT_PROMPT_SHA_AFTER
ZSH_THEME_GIT_PROMPT_STASHED="STASHED"
#ZSH_THEME_GIT_PROMPT_UNMERGED

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_no_bold[yellow]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%})%{$reset_color%} "

# For git_prompt_info. This says the branch and has a green tick if it is clean.
# Not defining for dirty state as that lacks precision
	ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg_bold[magenta]%}"
		ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"
	ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# State of the repo.
	ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[blue]%}?"
	ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}✙"
	ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}✘"
	ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}Δ"
ZSH_THEME_GIT_PROMPT_RENAMED="Renamed"

# Comparing against remote
	ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR="%{$BG[052]%}" # Redshift
	ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="⇑ "

	ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR="%{$BG[053]%}" # Blueshift
	ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="⇓ "

	ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE_COLOR="%{$BG[008]%}" # Gray area
	ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="⇕ "

local return_code="%(?..%F{red}%? ↵%f)"
local user_host="${PR_USER}%F{cyan}@${PR_HOST}"
local current_dir="%B%F{blue}%~%f%b"
local git_branch='$(git_prompt_info) $(git_prompt_status) $(git_remote_status)'

PROMPT="╭─<${user_host}─[${current_dir}]>─${git_branch}
╰─<%j $PR_PROMPT "
RPROMPT="${return_code}"
