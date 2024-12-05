{
  advice.statushints = true;
  apply.whitespace = "strip";
  branch = {
    autosetupmerge = true;
    autosetuprebase = "always";
  };
  clear.requireForce = true;
  color = {
    ui = "auto";
    diff = {
      # Catppuccin Mocha
      context = 59; # Surface1	59
      meta = 229; # Yellow	229
      frag = 176; # Mauve	176
      func = 75; # Sapphire	75
      old = 210; # Red	210
      new = 120; # Green	120
      commit = 183; # Lavender	183
      whitespace = "167 reverse"; # Maroon	167
      oldMoved = 217; # Flamingo	217
      newMoved = 218; # Pink	218
      oldMovedDimmed = 110; # Subtext 0	110
      newMovedDimmed = 152; # Subtext 1	152
      contextDimmed = 102; # Overlay 0	102
      oldDimmed = 60; # Overlay 1	60
      newDimmed = 79; # Teal	79
      contextBold = "103 bold"; # Overlay 2	103
      oldBold = "210 bold"; # Red	210
      newBold = "120 bold"; # Green	120
    };
    graph = {
      line = 229;
      node = 176;
      edge = 79;
    };
  };
  column.ui = "auto";
  commit = {
    template = "~/.config/git/templates/commit";
    verbose = 2;
  };
  core = {
    abbrev = 5;
    autocrlf = false;
    filemode = false;
    ignorecase = false;
    quotepath = "off";
    safecrlf = "warn";
    whitespace = "warn";
  };
  diff = {
    algorithm = "patience";
    mnemonicPrefix = true;
    renameLimit = 2048;
    renames = true;
    tool = "vimdiff";
  };
  difftool.prompt = false;
  fetch = {
    recurseSubmodules = "on-demand";
    writeCommitGraph = true;
  };
  format = {
    pretty = ''%C(#cba6f7)%<(6,trunc)%h%Creset %C(#f38ba8)%<(8,ltrunc)%GK%Creset %C(#fab387)%<(15,trunc)%an%Creset %C(#f9e2af)%ar%Creset %C(#94e2d5)%D %C(#cdd6f4)%s%Creset'';
    signOff = true;
  };
  help.autocorrect = 10;
  init = {
    templatedir = "~/.config/git/templates";
    defaultBranch = "master";
  };
  interactive.singlekey = true;
  log = {
    abbrevCommit = true;
    decorate = "short";
  };
  merge = {
    log = true;
    stat = true;
    conflictstyle = "zdiff3";
    tool = "vimdiff";
  };
  pack = {
    windowMemory = "256m";
    threads = 4;
  };
  pull.ff = "only";
  push = {
    default = "upstream";
    followTags = true;
    autoSetupRemote = true;
  };
  rebase.autosquash = true;
  receive.denyDeleteCurrent = "warn";
  "remote \"origin\"" = {
    prune = true;
  };
  rerere = {
    enabled = true;
    autoUpdate = true;
  };
  status.submodulesummary = true;
  tag.forceSignAnnotated = true;
  "url \"git://gist.github.com/\"".insteadOf = "gist:";
  "url \"git://github.com/\"".insteadOf = "github:";
  "url \"git@github.com:\"" = {
    insteadOf = "gh:";
    pushInsteadOf = "git://github.com/";
  };
  user.useConfigOnly = true;
  "filter \"lfs\"" = {
    required = true;
    clean = "git-lfs clean -- %f";
    smudge = "git-lfs smudge -- %f";
    process = "git-lfs filter-process";
  };
  "filter \"media\"" = {
    required = true;
    clean = "git media clean %f";
    smudge = "git media smudge %f";
  };
  "filter \"tabspace\"" = {
    clean = "expand -t 4";
  };
  gpg.ssh.allowedSignersFile = "~/.config/git/allowed_signers";
  # includeIf."hasconfig:remote.*.url:git@github.com:doitintl/**" = {
  # }
}
