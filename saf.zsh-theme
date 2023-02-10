PROMPT='
%{$fg[blue]%}-%{$reset_color%}$(check_git_prompt_info) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

function check_git_prompt_info() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        if [[ -z $(git_prompt_info) ]]; then
            echo "%{$fg[red]%}detached-head%{$reset_color%}"
        else
            echo "$(git_prompt_info)"
        fi
    fi
}
