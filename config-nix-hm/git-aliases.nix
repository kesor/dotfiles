{
  ad = "add";
  ap = "add -p";
  adp = "add -p";
  amend = "commit --amend";
  b = "branch";
  br = "branch";
  changes = "diff -name-status -r";
  child = ''!f() { for arg in \"$@\"; do for commit in $(git rev-parse $arg^0); do for child in $(git log --format='%H %P' --all | grep -F \" $commit\" | cut -f1 -d' '); do git describe $child 2> /dev/null || echo $child; done; done; done; }; f''; # find all direct children of given refs (from https://gist.github.com/kohsuke/7590246)
  ci = "commit";
  cia = "commit -a";
  co = "checkout";
  cob = "checkout -b";
  ctags = "!.git/hooks/ctags";
  d = "diff --color-words";
  di = "diff";
  dis = "diff  --staged";
  diw = "diff -w -b";
  diws = "diff -w -b --staged";
  fb = ''!f() { git branch -a --contains $1; }; f''; # find branches containing commit
  fc = ''!f() { git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short -S$1; }; f''; # find commits by source code
  fm = ''!f() { git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short --grep=$1; }; f''; # find commits by commit message
  ft = ''!f() { git describe --always --contains $1; }; f''; # find tags containing commit
  grep-group = "grep --break --heading --line-number";
  hub = "!open $(git hub-url)";
  hub-url = "!ruby -e 'puts (%Q{http://github.com/%s/%s/tree/master/} + %x{git rev-parse --show-prefix}) % %x{git config --get remote.origin.url}.match(%r{:([^/]+)/([^.]+).git$}).captures'";
  last = "log -1 HEAD";
# git config [format].pretty brings in the pretty instead of adding it to 'log'";
# --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an %C(red)%GK%n%C(bold)%C(white)%s %N'";
  logg = "log --graph --topo-order";
  loggs = "log --stat --graph --topo-order";
  logp = "log -p --color-words";
  pl = "pull --rebase";
  praise = "blame";
  pruneremote = "remote prune origin";
  pu = "push";
  review = "log --stat -p --reverse";
  ri = "rebase --interactive";
  search-git-history = ''!r() { git rev-list --all | xargs git grep -F $1; }; r''; # find a string in the entire git history
  show-graph = "log --graph --abbrev-commit --pretty=oneline";
  st = "status --short --branch";
  sti = "status --ignored --short";
  stt = "status --verbose";
  su = "submodule update --init --recursive";
}
