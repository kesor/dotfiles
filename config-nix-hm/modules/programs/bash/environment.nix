pkgs:
{
  LESS = "FRXg";
  LSCOLOR = "exfxcxdxfxegedabagacad";
  LS_COLORS = "\$(${pkgs.vivid}/bin/vivid generate catppuccin-mocha)";
  # extra EZA_COLORS available (not supported by vivid)
  # https://github.com/eza-community/eza/blob/main/man/eza_colors.5.md
  EZA_COLORS = "\$(${pkgs.vivid}/bin/vivid generate catppuccin-mocha)";
  NCURSES_NO_PADDING = "1";
  DO_NOT_TRACK = "1";
  GPGKEY = "596B0CFE";
  PYTHONDONTWRITEBYTECODE="1";
  PYTHONSTARTUP = "~/.pythonrc.py";
  GLOW_STYLE = "\${GLAMOUR_STYLE}";
  STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";

  # modify window title - done via enableVteIntegration=true in programs.bash
  # PROMPT_COMMAND = ''echo -ne \"\033]0;''${USER}@''${HOSTNAME}: ''${PWD/$HOME/~}\007\"'';
  # [ "$1" ] && PROMPT_COMMAND="echo -ne \"\\033]0;$*\\007\""
}
