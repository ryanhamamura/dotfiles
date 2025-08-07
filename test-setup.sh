#!/bin/bash

# Dry-run test script for dotfiles setup
# This script validates the setup without making actual changes

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "======================================"
echo "Dotfiles Setup Dry-Run Test"
echo "======================================"
echo

# Test function
test_file() {
    local file=$1
    local description=$2
    
    if [ -f "$file" ]; then
        echo -e "${GREEN}✓${NC} $description exists"
        # Check for bash syntax errors
        if [[ "$file" == *.sh ]] || [[ "$file" == *.zsh ]]; then
            if bash -n "$file" 2>/dev/null; then
                echo -e "  ${GREEN}✓${NC} Syntax check passed"
            else
                echo -e "  ${RED}✗${NC} Syntax errors found!"
                bash -n "$file"
            fi
        fi
    else
        echo -e "${RED}✗${NC} $description missing: $file"
    fi
}

# Test directory structure
echo "1. Checking directory structure..."
echo "-----------------------------------"
test_file "setup.sh" "Main setup script"
test_file "install/terminal.sh" "Terminal installer"
test_file "install/desktop.sh" "Desktop installer"
echo

# Test terminal installers
echo "2. Checking terminal installers..."
echo "-----------------------------------"
for installer in install/terminal/*.sh; do
    if [ -f "$installer" ]; then
        test_file "$installer" "$(basename $installer)"
    fi
done
echo

# Test desktop installers
echo "3. Checking desktop installers..."
echo "-----------------------------------"
for installer in install/desktop/*.sh; do
    if [ -f "$installer" ]; then
        test_file "$installer" "$(basename $installer)"
    fi
done
echo

# Test dotfiles structure
echo "4. Checking dotfiles structure..."
echo "-----------------------------------"
test_file "home/.zshrc" "Zsh configuration"
test_file "home/.gitconfig" "Git configuration"
test_file "home/.config/alacritty/alacritty.toml" "Alacritty config"
test_file "home/.config/nvim/init.lua" "Neovim config"
test_file "home/.config/ohmyposh/zen.toml" "Oh-my-posh theme"
echo

# Test zsh modules
echo "5. Checking zsh modules..."
echo "-----------------------------------"
for module in home/.config/zsh/*.zsh; do
    if [ -f "$module" ]; then
        test_file "$module" "$(basename $module)"
    fi
done
echo

# Test stow simulation
echo "6. Testing stow (simulation)..."
echo "-----------------------------------"
if command -v stow &> /dev/null; then
    echo -e "${GREEN}✓${NC} Stow is installed"
    # Dry run stow to check for conflicts
    if stow -n -v -t $HOME home 2>&1 | grep -q "WARNING"; then
        echo -e "${YELLOW}⚠${NC} Stow may have conflicts (this is normal for existing files)"
        echo "  Run 'stow -n -v -t \$HOME home' to see details"
    else
        echo -e "${GREEN}✓${NC} Stow simulation successful"
    fi
else
    echo -e "${RED}✗${NC} Stow is not installed"
fi
echo

# Check for required commands
echo "7. Checking required commands..."
echo "-----------------------------------"
commands=("git" "curl" "zsh" "stow")
for cmd in "${commands[@]}"; do
    if command -v $cmd &> /dev/null; then
        echo -e "${GREEN}✓${NC} $cmd is available"
    else
        echo -e "${YELLOW}⚠${NC} $cmd is not installed (will be installed by setup)"
    fi
done
echo

# Test script execution order
echo "8. Testing execution order..."
echo "-----------------------------------"
echo "Terminal scripts will run in order:"
for installer in install/terminal/*.sh; do
    [ -f "$installer" ] && echo "  - $(basename $installer)"
done
echo
echo "Desktop scripts will run in order:"
for installer in install/desktop/*.sh; do
    [ -f "$installer" ] && echo "  - $(basename $installer)"
done
echo

# Check GNOME environment
echo "9. Checking desktop environment..."
echo "-----------------------------------"
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
    echo -e "${GREEN}✓${NC} GNOME detected - desktop scripts will run"
else
    echo -e "${YELLOW}⚠${NC} Not GNOME - only terminal scripts will run"
    echo "  Current desktop: $XDG_CURRENT_DESKTOP"
fi
echo

# Summary
echo "======================================"
echo "Summary"
echo "======================================"
echo
echo "To run the actual setup:"
echo "  ./setup.sh"
echo
echo "To test stow without making changes:"
echo "  stow -n -v -t \$HOME home"
echo
echo "To see what files would be installed:"
echo "  find home -type f | sed 's|^home/|~/|'"
echo