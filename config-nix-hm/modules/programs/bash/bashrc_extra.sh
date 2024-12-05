# PROFILING OF THE PROFILE!
# set -x
# exec 2>&1
# exec &> >(ts -i '%.S' | tee "$HOME/bash-session.log")

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

if command -v nh > /dev/null; then
  # bash completions for nix helper
  eval "$(nh completions --shell bash)"
fi
