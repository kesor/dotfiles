{ pkgs, ... }:
with pkgs; {
  enable = true;
  aggressiveResize = true;
  baseIndex = 1;
  clock24 = true;
  escapeTime = 50;
  keyMode = "vi";
  prefix = "C-a";
  terminal = "tmux-256color";
  # shell = "${pkgs.bash}/bin/bash";
  extraConfig = ''
    ${builtins.readFile ./tmux.conf}
    ${builtins.readFile ./tmux-keys.conf}
    ${builtins.readFile ./tmux-mouse.conf}
  '';
  catppuccin = {
    enable = true;
    extraConfig = builtins.readFile ./tmux-catppuccin.conf;
  };
  plugins = [
    tmuxPlugins.open
    tmuxPlugins.sidebar
    tmuxPlugins.yank
  ];
}
