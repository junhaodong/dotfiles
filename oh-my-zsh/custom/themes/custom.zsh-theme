# Based on norm and gallois themes

# Show git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
}

# Show red * before branch if there are uncommitted changes
parse_git_dirty() {
  if command git diff-index --quiet HEAD 2> /dev/null; then
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  else
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  fi
}

git_custom_status() {
  local cb="$(parse_git_branch)"
  if [ -n "$cb" ]; then
    local prompt="$(parse_git_dirty)%{$reset_color%}"
    prompt+="$ZSH_THEME_GIT_PROMPT_PREFIX"
    prompt+="${cb#(refs/heads/|tags/)}"
    prompt+="$ZSH_THEME_GIT_PROMPT_SUFFIX"
    echo "$prompt"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}(%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗ "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}✓ "

# Left prompt (shorten cwd if >= 30 chars)
PROMPT='%{$fg[yellow]%}λ %m '
PROMPT+='%{$fg[green]%}%30<...<%~%<< '
PROMPT+='%{$fg[yellow]%}→ '

# Right prompt
RPROMPT='$(git_custom_status)$(ruby_prompt_info) %{$fg[yellow]%}%*%{$reset_color%}'

# More chars:
# ☀ ⚡ ♈ ✹ ǁ ǂ Ŧ ✡ 
