<center>
<h1>My Dotfiles</h1>
<img src=".github/previews/Monitor_Preview_08-43-21.png" alt="Desktop Showcase" width="768">
</center>

> [!NOTE]
> This Nix configuration is possible thanks to [soramanew](https://github.com/soramanew) and their work creating [Caelestia](https://github.com/caelestia-dots/shell).  All I have done is use it and made some minor modifications elsewhere to put together a working system for myself.

# Installation
Presuming you're starting from a live boot with nothing yet done to your machine, you'll want to install NixOS on your machine from a **minimal installation**.

When going through the live boot installer, choose `No Desktop` when prompted on which desktop environment to choose; you will not need one for this configuration.

## Working From A Minimal Installation
### Setting Up A Network Connection &mdash; WiFi
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
git clone https://github.com/toxocious/dotfiles.git $HOME/.config/nixos --branch NixOS
```

Before running the included installation script, be sure to copy the generated hardware configuration file into this repository:
```sh
sudo cp /etc/nixos/hardware-configuration.nix ./.config/nixos/hosts/desktop
```

> If you don't do this, there's a good chance that the installation will break **OR** will brick your system upon restarting.

Now you may proceed with the initial installation:
```sh
./install.sh athena
```

The initial installation process **will** take a fair amount of time as it downloads and installs all necessary packages and dependencies.
> Expect this to take around 10 to 20 minutes on a fresh system.


### Available Host Configurations
There are two included hosts that you need to be mindful of; one for a desktop configuration and one for a laptop configuration.

While it isn't *required*, it's strongly advised that you take a look at either of them and modify them to your needs.

> [!NOTE]
> This will be removed in the future and the repository will be updated to default to a single system.



## Notice
**Do NOT run the installation script as an administrator.**

Doing so will cause directories to potentially be created in the wrong place.

Ths install script will likely take several minutes.

The installer will create symlinks and overwrite existing files.
> Please backup your current configs before installing.
