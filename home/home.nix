{ pkgs, config, libs, ... }:

with import <nixpkgs> {};
with lib;

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];
    fonts.fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [ 
          "FiraCode"
        ];
      })
    ];

  users.users.simme = {
    isNormalUser = true;
    description = "simme";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "lxd"
      "video"
    ];
  };

  home-manager.users.simme = {
    nixpkgs.config.allowUnfree = true;

    imports = [
      ./programs/nvim.nix
      ./programs/zsh.nix
    ];

    home.packages = with pkgs; [
      _1password-gui
      exa
      git
      kitty
      lynx
      matterhorn
      mattermost-desktop
      obsidian
      rambox-pro
      spotify
      spotify-tui
      tmux
      neofetch
      tree
      ripgrep
      jq
      yq
      tdesktop
      pavucontrol
    ];
    programs = {
      starship.enable = true;
      chromium = {
        enable = true;
	extensions = [
	  "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
	  "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
	  "ldgfbffkinooeloadekpmfoklnobpien" # raindrop
	  "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
	  "kbfnbcaeplbcioakkpcpgfkobkghlhen" # grammarly 
	  "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
	];
      };
      vscode = {
        enable = true;
	package = pkgs.vscodium;
        extensions = with vscode-extensions; [
	  esbenp.prettier-vscode
	  golang.go
	  bierner.emojisense
	] ++ vscode-utils.extensionsFromVscodeMarketplace [
	  {
	    name = "catppuccin-vsc";
            publisher = "Catppuccin";
            version = "2.3.0";
            sha256 = "5S6XrdAJwnsy7JO62e4yvcKDJhOjxbnqaQbQuXlrZE0=";
	  }
	];
      };
      waybar = {
        enable = true;
	systemd.enable = true;
	settings = [{
	  height = 40;
	  layer = "top";
	  position = "bottom";
	  tray = { spacing = 10; };
	  modules-left = [
	    "sway/workspaces" 
	    "sway/mode" 
	    "sway/window" 
	  ];
	  modules-right = [ 
#	    "cpu"
#	    "memory"
#	    "pulseaudio"
	    "tray" 
	    "clock" 
	  ]; 
	}];
      };
    };
  };
}
