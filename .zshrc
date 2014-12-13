#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Source for agnoster-a prompt in Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zsh/foragnoster.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zsh/foragnoster.zsh"
fi

# Source percol a shell completion mooz/percol.
if [[ -s "${ZDOTDIR:-$HOME}/.zsh/percol.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zsh/percol.zsh"
fi

# Source alias defines.
if [[ -s "${ZDOTDIR:-$HOME}/.zsh/alias.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zsh/alias.zsh"
fi

# Source my function.
if [[ -s "${ZDOTDIR:-$HOME}/.zsh/myfunction.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zsh/myfunction.zsh"
fi

# Source fasd function.
if [[ -s "${ZDOTDIR:-$HOME}/.zsh/fasd.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zsh/fasd.zsh"
fi

