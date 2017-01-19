# Personalized!

# Grab the current version of ruby in use (via RVM): [ruby-1.8.7]
if [ -e ~/.rvm/bin/rvm-prompt ]; then
  LAMBDA_CURRENT_RUBY_="%{$fg[white]%}[%{$fg[magenta]%}\$(~/.rvm/bin/rvm-prompt i v)%{$fg[white]%}]%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    LAMBDA_CURRENT_RUBY_="%{$fg[white]%}[%{$fg[magenta]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$fg[white]%}]%{$reset_color%}"
  fi
fi
# Grab the current machine name: muscato
LAMBDA_CURRENT_MACH_="%{$fg[green]%}%m%{$fg[white]%}:%{$reset_color%}"


# Append the current git branch, if in a git repository: ~aw@master
LAMBDA_CURRENT_LOCA_="%{$fg[cyan]%}%~\$(git_prompt_info)%{$reset_color%}\$(parse_git_dirty)"

# Grab the current username: LAMBDA
LAMBDA_CURRENT_USER_="%{$fg[magenta]%}%n%{$reset_color%}"

# Use a λ for normal users and a λλλ for privelaged (root) users.
LAMBDA_PROMPT_CHAR_="%{$fg[red]%}%(!. λλλ. λ)%{$reset_color%}"

# For the git prompt, use a white @ and blue text for the branch name
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}@%{$fg[blue]%}"

# Close it all off by resetting the color and styles.
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# Do nothing if the branch is clean (no changes).
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Add 3 cyan ✗s if this branch is diiirrrty! Dirty branch!
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}✗✗✗"

# Put it all together!
PROMPT="$LAMBDA_CURRENT_RUBY_$LAMBDA_CURRENT_MACH_$LAMBDA_CURRENT_LOCA_ $LAMBDA_CURRENT_USER_$LAMBDA_PROMPT_CHAR_ "
