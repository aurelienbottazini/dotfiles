# -----------------------------------------------------------------------------
#          FILE: aure.zsh-theme
#   DESCRIPTION: oh-my-zsh theme file
#        AUTHOR: Aurélien Bottazzini
#       VERSION: 1
# -----------------------------------------------------------------------------

MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
local return_status="%(?,%{$fg[green]%}✓%{$reset_color%},%{$fg[red]%}✗%{$reset_color%}) "

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[black]%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$bg[red]%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$bg[yellow]%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$bg[green]%}%{$fg[yellow]%}"

ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="Δ"
ZSH_THEME_GIT_PROMPT_DELETED="␡"
ZSH_THEME_GIT_PROMPT_RENAMED="≈"
ZSH_THEME_GIT_PROMPT_UNMERGED="◫"
ZSH_THEME_GIT_PROMPT_UNTRACKED="⸮"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$bg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER=" %{$fg[magenta]%}%{$bg[black]%}%{$reset_color%}"

function source_control_char() {
  git branch >/dev/null 2>/dev/null && echo "G" && return
  hg root >/dev/null 2>/dev/null && echo "☿%" && return
  bzr root >/dev/null 2>/dev/null && echo "ℬ" && return
}

PROMPT='%{$bg[blue]%}%{$fg[black]%}%~ %{$reset_color%}%{$fg[blue]%}%{$bg[yellow]%}%{$reset_color%}%{$bg[yellow]%}%{$fg[black]%} $(source_control_char)$(git_prompt_info)$(git_prompt_status)%{$fg[red]%}%{$bg[magenta]%} %{$reset_color%}$(git_prompt_short_sha)
${return_status}'

RPROMPT='%{$fg[blue]%}%{$reset_color%}'
