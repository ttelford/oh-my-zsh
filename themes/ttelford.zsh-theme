# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
#
# Originally based on "bira"
#
# - Look into the 'kolo' theme for what may be a better way to do multiple
# version control systems.
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

GIT_DIRTY_COLOR=$FG[133]
GIT_CLEAN_COLOR=$FG[118]
GIT_PROMPT_INFO=$FG[112]

local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'

# Change the box-drawing 'bracket' at the beginning of the prompt to red when in
# vi command mode:
function red_chars()
{
	echo "%{$fg[red]%}${1}%{$reset_color%}"
}
#local top_box="⎧"
#local bottom_box="⎩"
local top_box="┌┤"
local middle_box=$'\n│'
local bottom_box=$'\n└─┤'
function top_prompt_info()
{
	echo "${${KEYMAP/vicmd/$(red_chars ${top_box})}/(main|viins)/${top_box}}"
}
function middle_prompt_info()
{
	echo "${${KEYMAP/vicmd/$(red_chars ${middle_box})}/(main|viins)/${middle_box}}"
}
function bottom_prompt_info()
{
	echo "${${KEYMAP/vicmd/$(red_chars ${bottom_box})}/(main|viins)/${bottom_box}}"
}
local top_prompt='$(top_prompt_info)'
local middle_prompt='$(middle_prompt_info)'
local bottom_prompt='$(bottom_prompt_info)'
function cond_newline_git_sha()
{
	short_sha=$(git_prompt_short_sha)
	if [[ -n ${short_sha} ]]
	then
		echo "$(middle_prompt_info)$(git_prompt_short_sha)"
	fi
}

# Misc characters
#╭ ─${user_host} ${current_dir}
#╰ ─%B$%b "
#┏┗⎧ ⎩ ┃│ ╱╲╳∆⌘ ⌂ ⌬ ┠ ✪

# Prompt
if [[ ${FPATH} == *plugins/git* ]]
then
	ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" (± "
	ZSH_THEME_GIT_PROMPT_SHA_AFTER=") "

	ZSH_THEME_GIT_PROMPT_PREFIX="(%{$GIT_PROMPT_INFO%}"
	ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%}%{$reset_color%})"
	ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘ "
	ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔ "

	ZSH_THEME_GIT_PROMPT_AHEAD="%{$FG[082]%}✪ %{$reset_color%} "
	ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%}✚ %{$reset_color%} "
	ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%}✹ %{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%}✖ %{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%}➜ %{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[082]%}═ %{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%}✭ %{$reset_color%}"

	local git_branch='$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status)$(git_prompt_ahead)%{$reset_color%}'
	local git_sha='$(cond_newline_git_sha)'
	PROMPT="${top_prompt} ${user_host}:${current_dir}${git_sha}${git_branch}${bottom_prompt} %B%(!.#.$)%b "
else
	PROMPT="${top_prompt} ${user_host}:${current_dir}${bottom_prompt} %B%(!.#.$)%b "
fi
RPS1='$(vi_mode_prompt_info)${return_code}'
