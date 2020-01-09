export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
export PATH="$HOME/.node_modules/bin:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export MSBuildSDKsPath="/opt/dotnet/sdk/2.2.105/Sdks/";
export TERMINAL=alacritty
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="garyblessington"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(
  git
)
source $ZSH/oh-my-zsh.sh
alias l='exa'
source $HOME/.secrets
