#!/bin/bash

# See https://github.com/rbenv/ruby-build/wiki#suggested-build-environment 
# for more details about dependencies.
sudo apt update && sudo apt install -y build-essential autoconf libssl-dev libyaml-dev zlib1g-dev libffi-dev libgmp-dev rustc
mise use -g ruby
