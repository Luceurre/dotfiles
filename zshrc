source ~/.zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle command-not-found
antigen bundle docker
antigen bundle node
antigen bundle django
antigen bundle python
antigen bundle autojump
antigen bundle cp
antigen bundle direnv
antigen bundle docker-compose
antigen bundle dirhistory
antigen bundle dotenv
antigen bundle man

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle supercrabtree/k
antigen bundle b4b4r07/enhancd
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply
