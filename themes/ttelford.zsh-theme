# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
#
# - Look into the 'kolo' theme for what may be a better way to do multiple
# version control systems.
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

GIT_DIRTY_COLOR=$FG[133]
GIT_CLEAN_COLOR=$FG[118]
GIT_PROMPT_INFO=$FG[112]

local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
#local git_branch='$(git_prompt_info)%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status)$(git_prompt_ahead)%{$reset_color%}'
local git_sha='$(git_prompt_short_sha)'

#PROMPT="╭─${user_host} ${current_dir}
#╰─%B$%b "
#RPS1="${git_branch} ${return_code}"
#┏┗⎧ ⎩ ┃│ ╱╲╳∆⌘ ⌂ ⌬ ┠ ✪
PROMPT="⎧ ${user_host}:${current_dir}${git_sha}${git_branch}
⎩ %B$%b "
#PROMPT="${user_host}:${current_dir}${git_branch}%B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_SHA_BEFORE="
⎪(± "
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
