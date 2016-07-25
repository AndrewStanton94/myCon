function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '➤'
}

function getJobs {
	echo "%(1j.$BG[014]$FG[000]⚙ %j%{$reset_color%}.)"
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

. "${myCon}/configs/zshDefinitions.zsh"
. "${myCon}/lib/git_tools.zsh"
. "${myCon}/lib/git_remote.zsh"

local return_code="%(?..%F{red}%? ↵%f)"
local user_host="${PR_USER}%F{cyan}@${PR_HOST}"
local current_dir="%B%F{blue}%~%f%b"

local git_prompt='$(draw_git_branch_state)$(a_git_prompt_status)$(git_remote_status)'

PROMPT="╭─<${user_host}─[${current_dir}]>─${git_prompt}
╰─<$(getJobs) $PR_PROMPT "
RPROMPT="${return_code}"
