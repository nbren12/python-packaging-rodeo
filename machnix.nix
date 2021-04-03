let
  mach-nix = import (builtins.fetchGit {
    url = "https://github.com/DavHau/mach-nix/";
    ref = "refs/tags/3.2.0";
  }) {};
in
mach-nix.mkPython {
  requirements = ''
    cartopy
    tensorflow>=2
  '';
}