#!/bin/bash 

# Run desktop installers 
for installer in install/desktop/*.sh; do source $installer; done