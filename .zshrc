alias ll='ls -al'
alias eb='vim ~/.zshrc && source ~/.zshrc'
alias ev='vim ~/.vimrc && source ~/.vimrc'
alias gitt='git status && git branch'
alias gcm='git commit -am $@'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

export PATH=~/.pyenv/shims:$PATH:/opt/homebrew/bin:/usr/local/bin

# fnm
export PATH="/Users/jhanink/Library/Application Support/fnm:$PATH"
eval "`fnm env`"

fnm use v18

cd ~/projects/joe
