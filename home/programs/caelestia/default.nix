{ inputs, pkgs, ... }:
{
	imports = [
		inputs.caelestia-shell.homeManagerModules.default
	];

	programs.caelestia = {
		enable = true;

		cli = {
			enable = true;
	
			settings.theme.enableGtk = true;
		};
	
		settings = {
			appearance = {
				anim = {
					durations = {
						scale = 1;
					};
				};

				font = {
					size = {
						scale = 1;
					};
				};

				padding.scale = 1;
				rounding.scale = 1;
				spacing.scale = 1;

				transparency = {
					enabled = true;
					base = 0.85;
					layers = 0.8;
				};
			};

			general = {
				apps = {
					terminal = [ "ghostty" ];
					audio = [ "pavucontrol" ];
					explorer = [ "thunar" ];
				};

				idle = {
					lockBeforeSleep = true;

					timeouts = [
						{
							timeout = 100;
							idleAction = "lock";
						}
					];
				};
			};

			background = {
				enabled = true;

				desktopClock = {
					enabled = false;
				};

				visualizer = {
					enabled = false;

					autoHide = true;
					rounding = 1;
					spacing = 1;
				};
			};

			bar = {
				persistent = true;
				showOnHover = true;

				dragThreshold = 20;

				workspaces = {
					activeIndicator = true;
					activeLabel = "󰮯 ";
					activeTrail = false;
					label = "  ";
					occupiedBg = false;
					occupiedLabel = "󰮯 ";
					rounded = true;
					showWindows = true;
					shown = 5;
				};

				status = {
					showAudio = true;
					
					showBattery = false;
					showKbLayout = false;

					showLockStatus = true;

					showBluetooth = true;
					showNetwork = true;
				};

				scrollActions = {
					brightness = false;
					volume = true;

					workspaces = true;
				};
			};

			border = {
				rounding = 25;
				thickness = 10;
			};

			dashboard = {
				enabled = true;
				showOnHover = true;

				mediaUpdateInterval = 500;
				visualiserBars = 45;
			};

			launcher = {
				actionPrefix = ">";
				dragThreshold = 50;
				vimKeybinds = false;
				enableDangerousActions = false;
				maxShown = 7;
				maxWallpapers = 9;

				useFuzzy = {
					apps = false;
					actions = false;
					schemes = false;
					variants = false;
					wallpapers = false;
				};
			};

			lock = {
				recolourLogo = false;
			};

			notifs = {
				actionOnClick = false;
				clearThreshold = 0.3;
				defaultExpireTimeout = 3000;
				expandThreshold = 20;
				expire = true;
			};

			osd = {
				hideDelay = 2000;
			};

			paths = {
				mediaGif = "root:/assets/bongocat.gif";
				sessionGif = "root:/assets/kurukuru.gif";
				wallpaperDir = "~/Pictures/Wallpapers";
			};

			services = {
				weatherLocation = "arizona";

				useFahrenheit = true;
				useTwelveHourClock = false;

				gpuType = "NVIDIA";

				smartScheme = true;
			};

			session = {
				dragThreshold = 30;
				vimKeybinds = false;
				commands = {
					logout = [ "hyprctl" "dispatch" "exit" ];
					shutdown = [ "systemctl" "poweroff" ];
					hibernate = [ "systemctl" "hibernate" ];
					reboot = [ "systemctl" "reboot" ];
				};
			};
		};
	};
}
