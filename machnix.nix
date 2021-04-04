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
    xgcm

    # manually add some of cartopy's deps to make mach-nix aware of their sub-deps
    sphinx == 3.1.1
    fiona == 1.8.18

    # add scipy to speed up build since mach-nix will use the wheel now
    scipy
  '';
}
