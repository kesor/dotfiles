# let
#   osRelease = builtins.readFile /etc/os-release;
#   osRelease = pkgs.lib.readFile /etc/os-release;
#   isDebianLike = [ "debian" ] == (builtins.match ".*ID_LIKE=([a-z]+).*" osRelease);
# in 
{
  "cd" = "z";
  ".." = "cd ..";
  "..." = "cd .. && cd ..";
  "cd.." = "cd ..";
  "cd-" = "cd -";
  "cat" = "bat";
  "path" = "echo -e \${PATH//:/\\n}";
  "grep" = "grep --color=auto";
  "fgrep" = "fgrep --color=auto";
  "egrep" = "egrep --color=auto";
  "vi" = "nvim";
  "vidiff" = "nvim -d";
  "vimdiff" = "nvim -d";
  "cddev" = "cd ~/src";
  "cdsrc" = "cd ~/src";
  "cddot" = "cd ~/src/dotfiles";
  "g" = "git";
  "gi" = "git";
  "q" = "quilt";
  "compose" = "docker-compose";
  "weather" = "curl -s https://wttr.in";
  "xxd" = "0x";

  "apt" = "sudo nala";
}
# // (if isDebianLike then
# {
#   "apt" = "sudo nala";
# }
# else {})
