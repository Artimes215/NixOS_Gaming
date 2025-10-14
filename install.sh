# Stage changes to git - rebuilding can break if this isn't done.
git add .

# Create base directories that will be used later.
echo "Creating core directories in ${HOME}"
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Pictures
mkdir -p ~/Pictures/Wallpapers
sudo cp -r ./assets/wallpapers/. ~/Pictures/Wallpapers
mkdir -p ~/Pictures/Avatars
sudo cp -r ./assets/avatars/. ~/Pictures/Avatars
sudo cp ./assets/avatars/13388656.png ~/.face
mkdir -p ~/Videos
echo " - Core directories have been created"
echo ""

# Backing up nixos hardware configuration.
echo "Backing up your NixOS Hardware Configuration"
sudo cp /etc/nixos/hardware-configuration.nix /etc/nixos/hardware-configuration.nix.bak
echo " - Backup complete (/etc/nixos/hardware-configuration.nix.bak)"
echo ""

# Copy the dotfiles and nix configuration files into .config/nixos.
echo "Copying dotfiles into ${HOME}/.config/nixos"
mkdir -p ~/.config/nixos
sudo cp -ra ./. ~/.config/nixos
echo " - Copying complete."
echo ""

# Rebuild nixos
echo "Rebuilding nixos using the flake."
sudo nixos-rebuild switch --flake ~/.config/nixos#athena
