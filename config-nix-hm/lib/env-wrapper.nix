{ lib, pkgs, ... }:

let
  # Function to wrap a package with custom environment variables
  makeWrappedPackage = pkg: envVars: pkgs.symlinkJoin {
    name = "env-wrap-${pkg.pname or pkg.name}";
    paths = [ pkg ]; # Symlink all files form the original
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      for exe in ${lib.getExe pkg}; do
        exeName=$(basename "$exe")
        rm -f "$out/bin/$exeName"
        makeWrapper "$exe" "$out/bin/$exeName" \
          ${lib.concatMapStringsSep " " (kv: "--set ${kv.name} ${kv.value}") (lib.attrsToList envVars)}
      done
    '';
  };
in {
  wrap = makeWrappedPackage;
}
