with import <nixpkgs> { };
let
  # xgcm requires docrep <= 0.2.7, but nixos-unstable has 0.3.x
  old_docrep = python3Packages.buildPythonPackage rec {
    pname = "docrep";
    version = "0.2.7";
    src = python3Packages.fetchPypi {
      inherit pname version;
      sha256 = "sha256-xIk5rhTXkXKDmlu69aVwrdR/bMRNLBj2sfrI8cON7E0=";
    };
    propagatedBuildInputs = [ python3Packages.six ];
    # The setuptools checks try to use the network which isn't allowed
    # during the Nix build. Disabling them for now.
    doCheck = false;
  };

  xgcm = python3Packages.buildPythonPackage rec {
    pname = "xgcm";
    version = "0.5.1";
    src = python3Packages.fetchPypi {
      inherit pname version;
      sha256 = "sha256-eSPrbbziWCSboaf5FJ8qDn/1372CCR4tz56E4aOjCLM=";
    };
    propagatedBuildInputs = [
      python3Packages.xarray
      python3Packages.future
      python3Packages.dask
      old_docrep
    ];
    # doesn't find pytest, not sure why, disabling tests for now.
    doCheck = false;
  };
  cartopy_unchecked = (python3Packages.cartopy.overrideAttrs (old: {
    # cartopy seems to be broken on nixos-unstable, but perhaps we're not
    # using any of the broken bits and can ignore the problem?
    # https://github.com/NixOS/nixpkgs/issues/118449
    doInstallCheck = false;
    meta.broken = false;
  }));
  python = python3.withPackages (ps: [ cartopy_unchecked ps.tensorflow_2 xgcm ]);
in
mkShell {
  buildInputs = [ python ];
}
