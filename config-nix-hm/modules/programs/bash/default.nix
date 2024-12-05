{ config, pkgs, ... }:
{
  config = {
    programs.bash = {
      enable = true;
      enableVteIntegration = true;
      enableCompletion = true;
      historySize = 10000;
      historyFileSize = 10000;
      historyControl = [ "ignoreboth" ];
      historyIgnore = [ "ls" "cd" "exit" "cddev" "cddot" ];
      shellOptions = [
        # Append to history file rather than replacing it.
        "histappend"
        # check the window size after each command and, if
        # necessary, update the values of LINES and COLUMNS.
        "checkwinsize"
        # Extended globbing.
        "extglob"
        "globstar"
        # Warn if closing shell with running jobs.
        "checkjobs"
      ];
      sessionVariables = (import ./environment.nix pkgs) // {
        LD_LIBRARY_PATH = "${config.home.profileDirectory}/lib\${LD_LIBRARY_PATH:+:\$LD_LIBRARY_PATH}";
      };
      shellAliases = import ./aliases.nix;

      # profileExtra = ""; # extras for login shell
      initExtra = builtins.readFile ./bashinit_extra.sh; # extras for interactive shell
      bashrcExtra = builtins.readFile ./bashrc_extra.sh; # extra for ~/.bashrc
    };
  };
}
