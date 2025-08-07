# Base PATH
export PATH=$HOME/.local/bin:$PATH

# Go configuration
if [ -d "/usr/local/go/bin" ] ; then 
  PATH="/usr/local/go/bin:$PATH"
fi

export GOROOT_BOOTSTRAP=/usr/lib/go-1.23
export GOROOT=$HOME/goroot
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"