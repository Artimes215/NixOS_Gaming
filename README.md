<center>
<h1>My Dotfiles</h1>
<img src=".github/previews/Wallpaper.png" alt="Desktop Showcase" width="768">
</center>

> [!NOTE]
> This Nix config is based on soramanew's work of [Caelestia](https://github.com/caelestia-dots/shell).  The installation setup and guide is thanks to Toxocious's [dotfiles] (https://github.com/Toxocious/dotfiles). This version of Nix is geared towards gaming on NVIDIA GPU and AMD CPU, but it is still configurable enough to change.

# Installation
Presuming you're starting from a live boot with nothing yet done to your machine, you'll want to install NixOS on your machine from a **minimal installation**.

When going through the live boot installer, choose `No Desktop` when prompted on which desktop environment to choose; you will not need one for this configuration.

## Working From A Minimal Installation
### Setting Up A Network Connection &mdash; WiFi

Skip this step if using ethernet, otherwise do the following:

For WiFi users, you'll also want to connect to a network if you haven't yet.
```sh
$ nmcli device wifi list
$ nmcli device wifi connect "<SSID>" password "<PASSWORD>"
$ ping google.com
```

Verify that you have a connection by pinging a website. If you have successfully connected to your network, proceed with rebuilding your system.

### Adding The Git Package
Once you've successfully booted into your new installation and have logged in, install git in a temporary nix shell:
```sh
nix-shell -p git
```

Afterwards, clone this repository into the `~/.config/nixos` directory:
```sh
git clone https://github.com/TyPolley/NixOS_Gaming.git $HOME/.config/nixos --branch NixOS
```

###IMPORTANT
Before running the included installation script, be sure to copy the generated hardware configuration file into this repository:
```sh
sudo cp /etc/nixos/hardware-configuration.nix ./.config/nixos/hosts/desktop
```

> If you don't do this, there's a good chance that the installation will break **OR** will brick your system upon restarting.

You will need to change the username/hostname variables to what you want before starting the install, otherwise it will use what is already set. You can find those variables in:

#### Username:
- /hosts/desktop/variables.nix
  
#### Hostname:
- /flake.nix
- /install.sh
- /hosts/desktop/variables.nix

Now that you have cloned the .config file **AND** changes the username/hostname variables, change directories to where the installer lives:
```sh
cd ~/.config/nixos
```

Now you may proceed with the initial installation:
```sh
./install.sh
```

The initial installation process **will** take a fair amount of time as it downloads and installs all necessary packages and dependencies.
> Expect this to take around 10 to 20 minutes on a fresh system.



## Notice
**Do NOT run the installation script as an administrator.**

Doing so will cause directories to potentially be created in the wrong place.

Ths install script will likely take several minutes.

The installer will create symlinks and overwrite existing files.
> Please backup your current configs before installing.

## Thanks

Thanks again to soromanew and Toxocious for putting in so much work to get a cool looking Hyprland/NixOS set up running