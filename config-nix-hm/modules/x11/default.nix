{ config, pkgs, lib, ... }:

let
  envVarsWrapper = import ./../../lib/env-wrapper.nix { inherit lib pkgs; };
in

{
  config = {
    xrandr.enable = true;

    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrains Mono" ];
        serif = [ "Gelasio" ];
        sansSerif = [ "Fira Sans" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };

    xsession = {
      enable = true;
      windowManager.command = "x-window-manager";
      initExtra = (import ./xsession-init-extra.sh.nix) pkgs;
      importedVariables = [
        "GTK_A11Y"
        "QT_ACCESSIBILITY"
      ];
    };

    xresources = {
      properties = {
        "Xft.dpi" = 109;
        "Xft.antialias" = true;
        "Xft.hinting" = true;
        "Xft.autohint" = false;
        "Xft.hintstyle" = "hintslight";
        "Xft.lcdfilter" = "lcddefault";
        "Xft.rgba" = "vrgb";
      };
      extraConfig = "${builtins.readFile ./xresources.xrdb}";
    };

    qt = {
      enable = true;
      platformTheme.name = "kvantum";
      style = {
        name = "kvantum";
        catppuccin.enable = true;
      };
    };

    gtk = {
      enable = true;
      # catppuccin.enable = true; ## deprecated unsupported package :(
      # theme = {
      #   package = catppuccin-gtk;
      #   # name = "Default";
      #   # name = "Catppuccin-Mocha-Standard";
      #   # name = "Catppuccin-Frappe-Standard-Blue-Dark";
      # };
    };

    xdg = {
      portal = with pkgs; {
        enable = true;
        xdgOpenUsePortal = true;
        configPackages = [ cinnamon-session ];
        extraPortals = [
          xdg-desktop-portal-gtk
          xdg-desktop-portal-gnome
        ];
        config = {
          x-cinnamon = { default = [ "xapp" "gtk" ]; };
          common = { default = [ "gtk" ]; };
        };
      };
    };

    dconf = with lib.hm.gvariant; {
      enable = true;
      settings = {
        # theme
        # https://github.com/GNOME/gsettings-desktop-schemas/tree/master/schemas
        "org/gnome/desktop/peripherals/keyboard" = {
          repeat = false;
          # repeat-interval = mkUint32 15;
          # delay = mkUint32 150;
        };
        "org/gnome/desktop/input-sources" = {
          sources = "[('xkb','us'),('xkb','il'),('xkb','us+rus')]";
          xkb-options = "['grp:shifts_toggle]";
          xkb-model = "'hhk+basic'";
          per-window = true;
        };
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          font-name = "Noto Sans 12";
          monospace-font-name = "Noto Sans Mono 12";
          gtk-theme = "Adwaita";
          cursor-theme = "Adwaita";
          cursor-size = mkUint32 36;
          icon-theme = "Adwaita";
        };
        "org/gnome/desktop/peripherals/mouse" = {
          double-click = 400;
          drag-threshold = 8;
          motion-threshold = 2;
        };
        # https://github.com/linuxmint/cinnamon-desktop/tree/master/schemas
        "org/cinnamon/theme" = {
          name = "Adwaita";
        };
        "org/cinnamon/desktop/interface" = {
          color-scheme = "prefer-dark";
          font-name = "Noto Sans 12";
          monospace-font-name = "Noto Sans Mono 12";
          gtk-theme = "Adwaita";
          cursor-theme = "Adwaita";
          icon-theme = "Adwaita";
        };
        "org/cinnamon/desktop/input-sources" = {
          sources = "[('xkb','us'),('xkb','il'),('xkb','us+rus')]";
          xkb-options = "['grp:shifts_toggle]";
          xkb-model = "'hhk+basic'";
          per-window = true;
        };
        "org/cinnamon/settings-daemon/peripherals/keyboard" = {
          repeat = false;
          # delay = mkUint32 150;
          # repeat-interval = mkUint32 15;
        };
        "org/cinnamon/settings-daemon/peripherals/mouse" = {
          double-click = 400;
          drag-threshold = 8;
          motion-threshold = 2;
        };
        "org/cinnamon/desktop/privacy".remember-recent-file = false;
        "org/cinnamon/desktop/applications/calculator".exec = "speercrunch";
        "org/cinnamon/desktop/applications/terminal".exec = "kitty";
        "org/cinnamon/desktop/background" = {
          picture-options = "zoom";
          picture-uri = "file:///home/evgeny/Pictures/Wallpapers/adrien-olichon-RCAhiGJsUUE-unsplash.jpg";
        };
      };
    };

    programs.rofi = {
      enable = true;
      catppuccin.enable = true;
      plugins = with pkgs; [ rofi-bluetooth rofi-calc rofi-emoji rofi-file-browser ];
      font = "JetBrains Mono 12";
      terminal = "kitty";
    };

    programs.timidity.enable = true;

    services = {
      dunst = {
        enable = true;
        catppuccin.enable = true;
      };
      flameshot = {
        enable = true;
      };
      gnome-keyring = {
        enable = true;
        components = [ "pkcs11" "secrets" ];
      };
      polybar.catppuccin.enable = true;
      xsettingsd = {
        enable = true;
        settings = {
          "Xft/Antialias" = true;
          "Xft/Hinting" = true;
        };
      };
      sxhkd = {
        enable = true;
      };
      remmina = {
        enable = true;
        package = (config.lib.nixGL.wrap pkgs.remmina);
      };
      picom = {
        enable = true;
        package = (config.lib.nixGL.wrap pkgs.picom);
        # backend = "glx";
        fade = true;
        fadeDelta = 1;
        opacityRules = [ ];
        shadow = true;
        shadowExclude = [
          "_GTK_FRAME_EXTENTS@:c"
          "override_redirect = true"  
          "window_type = 'menu'"
        ];
        settings = {
          # blur = {
          #   method = "gaussian";
          #   size = 1;
          #   deviation = 1;
          # };
          corner-radius = 4;
          rounded-corners-exclude = [
            "class_g = 'pasystray'"
          ];
          corner-radius-rules = [ ];
        };
      };
      pasystray = {
        enable = true;
        extraOptions = [ "-g" ];
      };
      stalonetray = {
        enable = true;
        config = {
          background = "#181825";
          decorations = "none";
          grow_gravity = "NW";
          icon_gravity = "NE";
          scrollbars = "none";
          sticky = true;
        };
      };
      xscreensaver = {
        enable = false;
        package = (config.lib.nixGL.wrap pkgs.xscreensaver);
        settings = {
          mode = "one";
          selected = 143;
          splash = "False";
          dpmsEnabled = "True";
          dpmsQuickOff = "True";
        };
      };
      screen-locker = {
        enable = true;
        lockCmd = "\${HOME}/.nix-profile/bin/xset dmps force off"; # xscreensaver-command --activate";
        xautolock.enable = true;
      };
      blueman-applet.enable = true;
      unclutter.enable = true;
      lorri.enable = true;
    };

    home.packages = with pkgs; [
      (config.lib.nixGL.wrap blender)
      (config.lib.nixGL.wrap discord)
      (config.lib.nixGL.wrap gimp)
      (config.lib.nixGL.wrap inkscape)
      (config.lib.nixGL.wrap obsidian)
      (config.lib.nixGL.wrap super-slicer-latest)
      (config.lib.nixGL.wrap tradingview)
      (config.lib.nixGL.wrap vscode)

      (envVarsWrapper.wrap (config.lib.nixGL.wrap brave) {
        LD_LIBRARY_PATH = "${config.home.profileDirectory}/lib";
      })
      
      (envVarsWrapper.wrap (config.lib.nixGL.wrap slack) {
        LD_LIBRARY_PATH = "${config.home.profileDirectory}/lib";
      })

      (envVarsWrapper.wrap (config.lib.nixGL.wrap google-chrome) {
        LD_LIBRARY_PATH = "${config.home.profileDirectory}/lib";
      })

      ## STEAM
      (config.lib.nixGL.wrap steam)
      gamescope
      protonup
      gamemode
      mangohud

      ## Applications
      ardour
      at-spi2-core
      audacity
      baobab
      blueman
      calibre
      dconf-editor
      evince
      file-roller
      gcr
      gerbv
      gnome-font-viewer
      gnome-sound-recorder
      kbdd
      nemo-with-extensions
      polybar
      qbittorrent
      speedcrunch
      vlc
      virt-viewer
      virt-manager
      xdotool
      xorg.xhost
      xorg.xkbcomp
      xorg.xmodmap
      xorg.xrdb
      xorg.xset
      xorg.xsetroot
      xournalpp
      xsel
      xss-lock

      ## THEMES:
      humanity-icon-theme

      ## SUCKLESS
      slock
      slstatus

    ];

  };
}
