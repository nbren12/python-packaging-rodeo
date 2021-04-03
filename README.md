The following recipe is kryptonite for most python package managers
- tensorflow - is bloated and pins specific versions of many of  its dependencies
- cartopy - has many system dependencies
-  <random niche package that's on pypi >. This can be easily installed by `pip install`, but isn't in most distributions. The tool docrep is a good example.

Typically, one will need to use several package managers to handle this situation. The Rodeo sees if there is any ONE tool that can manage these three dependencies. To manage a dependency a tool must 
1. be able to install a working  environment 
   1. in a reasonable amount of time
2. be able to lock this installed environment so that it can reproduced at a future date.

This project tests point 1 quantatively using continuous integration (CI) and
assess #2 qualitatively.

The goal of this project is to compare on Mac (currently not implemented) and linux
1. [anaconda](https://docs.conda.io/en/latest/)
2. [pip](https://pip.pypa.io/en/stable/)
3. apt-get (on an ubuntu system)
4. [Nix](https://nixos.org/)
   1. nixpkgs (default setup)
   1. [poetry2nix](https://github.com/nix-community/poetry2nix)
   1. [mach-nix](https://github.com/DavHau/mach-nix)

# Results

The more packages a tool can install the better. Passing CI tests is good.

| Package Manager | CI Status   |  Packages Attempted to install [^1]  | 
|--------------------------|----------------|-------------------------------------------|
| pip | [![Python package](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/pip.yaml/badge.svg?branch=master)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/pip.yaml) | cartopy, tensorflow  |
| conda | [![Conda](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/conda.yaml/badge.svg)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/conda.yaml) | cartopy, tensorflow  |
| nixpkgs |[![Nix (nixpkgs)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/nix.yaml/badge.svg)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/nix.yaml)| cartopy, tensorflow  |
| nixpkgs (machnix) | [![Nix (machnix)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/mach-nix.yaml/badge.svg)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/mach-nix.yaml) | cartopy, tensorflow |
| nixpkgs (poetry2nix) | [![Nix (poetry2nix)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/poetry2nix.yaml/badge.svg)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/poetry2nix.yaml) | cartopy, tensorflow, docrep |
 | apt-get  | [![Nix (machnix)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/apt-get.yaml/badge.svg)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/apt-get.yaml) | cartopy |

[^1]: Readers should assume that the tool CANNOT install more than this

# Contributing

Please contribute a new packaging tool or modify an existing tool's configuration to improve its results. That said, we will need to discuss what a "tools configuration" consists of. Some rough thoughts are:
- conda can install pip dependencies, but to my knowledge it does not ensure that pip versions installed are consistent with the resolved conda versions, and cannot be frozen very easily
- Nix-based tools have more leeway in this regard since its "configuration" is the nix programming language
- Manually packaging the <random pip package> (e.g. writing an explicit nix derivation, conda recipe, etc) is not allowed. 
