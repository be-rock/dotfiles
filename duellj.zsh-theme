# zsh duellj theme
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo "±" && return
  echo '○'
}
local git_info='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}-%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"

PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;34m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} - %b%{\e[0;34m%}%B[%b%{\e[1;37m%}%~%{\e[0;34m%}%B]%b%{\e[0m%} - %{\e[0;34m%}%B[%b%{\e[0;33m%}%!%{\e[0;34m%}%B]%b%{\e[0m%}$(git_prompt_info)
%{\e[0;34m%}%B└─%B[%{\e[1;35m%}$%{\e[0;34m%}%B]%{\e[0m%}%b '
RPROMPT='($CONDA_DEFAULT_ENV) [20%D %*] $return_code'
PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '

# end
