The following recipe is kryptonite for most python package managers
- tensorflow - is bloated and pins specific versions of many of  its dependencies
- cartopy - has many system dependencies
-  <random niche pakage that's on pypi >. The tool docrep is a good example.
Typically, one will need to use several package managers to handle this situation

The Rodeo sees if there is any ONE tool that can manage these three dependencies. To manage a dependency a tool must 
1. be able to install a working  environment 
   1. in a reasonable amount of time
2. be able to lock this installed environment so that it can reproduced at a future date.

This project tests point 1 quantatively using continuous integration (CI) and
assess #2 qualitatively.

The goal of this project is to compare on Mac and linux
1. anaconda
2. pip
3. apt-get
4. Nix
   1. nixpkgs
   1. poetry2nix
   1. mach-nix

# Results

| Package Manager | CI Status   |  Packages Attempted to install [^1]  | 
|--------------------------|----------------|-------------------------------------------|
| pip | [![Python package](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/pip.yaml/badge.svg?branch=master)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/pip.yaml) | cartopy, tensorflow  |
| conda | [![Conda](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/conda.yaml/badge.svg)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/conda.yaml) | cartopy, tensorflow  |
| nixpkgs |[![Nix (nixpkgs)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/nix.yaml/badge.svg)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/nix.yaml)| cartopy, tensorflow  |
| nixpkgs (machnix) | [![Nix (machnix)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/mach-nix.yaml/badge.svg)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/mach-nix.yaml) | cartopy, tensorflow |
| nixpkgs (poetry2nix) | [![Nix (poetry2nix)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/poetry2nix.yaml/badge.svg)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/poetry2nix.yaml) | cartopy, tensorflow, docrep |
 | apt-get  | [![Nix (machnix)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/mach-nix.yaml/badge.svg)](https://github.com/nbren12/python-packaging-rodeo/actions/workflows/mach-nix.yaml) | cartopy |

[^1]: Readers should assume that the tool CANNOT install more than this
