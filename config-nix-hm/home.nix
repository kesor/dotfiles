{ config, pkgs, ... }:

with pkgs; {

  targets.genericLinux.enable = true;

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "blue";
  };

  xdg = {
    enable = true;
    userDirs.enable = true;
    mimeApps.enable = true; # TODO: manage ~/.config/mimeapps.list & ~/.local/share/applications/mimeapps.list
  };

  programs.bat = {
    enable = true;
    catppuccin.enable = true;
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.eza = {
    enable = true;
    package = ez-eza;
    enableBashIntegration = true;
    icons = "auto";
    colors = "auto";
    git = true;
    extraOptions = [ "--group-directories-first" "-F" ];
  };

  programs.fd.enable = true;
  programs.feh.enable = true;

  programs.fzf = {
    enable = true;
    catppuccin.enable = true;
    defaultCommand = "fd --type f --strip-cwd-prefix --exclude .git";
    tmux.enableShellIntegration = true;
    enableBashIntegration = true;
  };

  programs.gh = {
    enable = true;
    settings = {
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };
    gitCredentialHelper.enable = false;
  };

  programs.git = {
    enable = true;
    userName = "Evgeny Zislis";
    userEmail = "evgeny.zislis@gmail.com";
    signing = {
      key = "596B0CFE";
      signByDefault = true;
    };
    delta = {
      enable = true;
      options = {
        dark = true;
        navigate = true;
        line-numbers = true;
      };
    };
    extraConfig = import ./git-extraconfig.nix;
    aliases = import ./git-aliases.nix;
    includes = [
      { path = "~/.config/git/secrets"; }
      { path = "~/.config/git/config.local"; }
    ];
  };

  programs.gpg = {
    enable = true;
    settings = {
      quiet = true;
      no-greeting = true;
      default-key = "596B0CFE";
      charset = "utf-8";
    };
    scdaemonSettings.disable-ccid = true;
  };

  programs.home-manager.enable = true;
  programs.info.enable = true;

  programs.jq = {
    enable = true;
    # catppuccin mocha colors for jq
    colors = {
      null = "38;5;103";         # Overlay 2 (slightly muted look)
      false = "38;5;215";        # Peach (warm contrast)
      true = "38;5;215";         # Peach (same as `false` for consistency)
      numbers = "38;5;215";      # Peach (used for constants/numbers)
      strings = "38;5;120";      # Green (aligned with strings in Mocha theme)
      arrays = "38;5;79";        # Teal (good for differentiating arrays)
      objects = "38;5;111";      # Blue (makes objects distinct)
    };
  };

  programs.kitty = {
    enable = true;
    catppuccin.enable = true;
    package = (config.lib.nixGL.wrap kitty);
    font = {
      name = "JetBrains Mono";
      size = 12.0;
    };
    # shellIntegration.enableBashIntegration = true;
    settings = {
      update_check_interval = 0;
      paste_actions = "no-op";
      disable_ligatures = "cursor";
      background = "#010203";
      clear_all_shortcuts = true;
      confirm_os_window_close = 0;
      sync_to_monitor = false;
      enable_audio_bell = false;
      dynamic_background_opacity = "true";
      background_opacity = "0.99";
      cursor_trail = 3;
      cursor_trail_decay = "0.2 0.4";
      cursor_trail_start_threshold = 3;
    };
    keybindings = {
      "ctrl+shift+c" = "copy_and_clear_or_interrupt";
      "ctrl+i" = "send_text all \x1b[105;5u";
      "ctrl+m" = "send_text all \x1b[109;5u";
      "ctrl+shift+equal" = "change_font_size all +0.5";
      "ctrl+shift+minus" = "change_font_size all -0.5";
      "ctrl+shift+backspace" = "change_font_size all 0";
    };
  };

  programs.less.enable = true;
  programs.lesspipe.enable = true;

  programs.man.enable = true;

  programs.neovim = {
    enable = true;
    catppuccin.enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    extraConfig = "${builtins.readFile ./neovim-init.vim}";
    plugins = with pkgs.vimPlugins; [
      vim-nix
      lazy-nvim
      zoxide-vim
    ];
  };

  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    settings = builtins.fromTOML "${builtins.readFile ./oh-my-posh.toml}";
  };

  # programs.readline = {
  # TODO: import ~/.inputrc
  #   enable = true;
  #   variables = {
  #     editing-mode = "vi";
  #   };
  # };

  programs.ripgrep.enable = true;

  # programs.ssh = {
  # TODO: Import ~/.ssh/config
  #   enable = true;
  #   package = openssh_gssapi;
  #   forwardAgent = true;
  #   compression = true;
  #   hashKnownHosts = true;
  #   controlMaster = "auto";
  # };

  programs.tmux = import ./programs/tmux pkgs;

  programs.yt-dlp = {
    enable = true;
    settings = {
      cookies-from-browser = "brave+kwallet5";
      prefer-free-formats = true;
      embed-subs = true;
      embed-thumbnail = true;
      embed-metadata = true;
      embed-chapters = true;
      embed-info-json = true;
      sub-langs = "en";
    };
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };
    lorri.enable = true;
  };

  home.username = "evgeny";
  home.homeDirectory = "/home/evgeny";
  home.enableNixpkgsReleaseCheck = false;

  home.packages = [
    xdg-user-dirs

    ## NEOVIM
    bash-language-server
    black
    dockerfile-language-server-nodejs
    lua
    lua-language-server
    luarocks
    vim-language-server
    yaml-language-server

    _0x
    autocutsel
    awscli
    bats
    binutils
    brightnessctl
    bzip2
    coreutils
    cpio
    dash
    ddcutil
    delta
    dfu-util
    diffutils
    direnv
    dnsutils
    docker
    docker-compose
    dust
    ffmpeg
    file
    universal-ctags
    findutils
    glibc
    ipmitool
    glow
    gnugrep
    gnumake
    gnused
    gnutar
    gpaste
    grex
    gzip
    imagemagick
    iproute2
    jq
    jqp
    lemminx
    lxi-tools
    mailutils
    miscfiles
    mosh
    openssh_gssapi
    pandoc
    procps
    procs
    quilt
    sd
    shellcheck
    netcat
    socat
    su
    tokei
    util-linux
    xz
    zenity
    zlib
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/evgeny/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    LANG = "en_US.utf-8";
    LC_CTYPE = "en_US.utf-8";
    LC_ALL = "en_US.utf-8";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
