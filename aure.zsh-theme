# -----------------------------------------------------------------------------
#          FILE: aure.zsh-theme
#   DESCRIPTION: oh-my-zsh theme file
#                Made for a light background with PragmataPro font.
#        AUTHOR: Aurélien Bottazzini
#       VERSION: 1
# -----------------------------------------------------------------------------

MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
local return_status="%(?,%{$fg[green]%}⍨%{$reset_color%},%{$fg[red]%}⍩%{$reset_color%}) "

ZSH_THEME_GIT_PROMPT_PREFIX="|"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ⌁%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[red]%} ⚠%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ⍢%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ⁇"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} Δ"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ‼"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} →"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ↔"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ⇢"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

function source_control_char() {
  git branch >/dev/null 2>/dev/null && echo "%{$fg[green]%}G%{$reset_color%}" && return
  hg root >/dev/null 2>/dev/null && Echo "%{$fg[blue]%}☿%{$reset_color%}" && return
  bzr root >/dev/null 2>/dev/null && Echo "%{$fg[yellow]%}ℬ%{$reset_color%}" && return
}

PROMPT='
%{$fg[blue]%}%~%{$reset_color%} $(source_control_char)$(git_prompt_info)
${return_status}'

RPROMPT='%{$fg[blue]%}$(~/.rvm/bin/rvm-prompt) $(git_prompt_short_sha)$(git_prompt_status)%{$reset_color%}'
