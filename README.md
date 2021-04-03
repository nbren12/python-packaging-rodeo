The following recipe is kryptonite for most python package managers
- tensorflow - is bloated and pins specific versions of many of  its dependencies
- cartopy - has many system dependencies
-  <random small package that's on pypi but no place else>

The Rodeo sees if there is any ONE tool that can manage these three dependencies. To manage a dependency a tool must 
1. be able to install a working  environment 
   1. in a reasonable amount of time
2. be able to lock this installed environment so that it can reproduced at a future date.

This project tests point 1 quantatively using continuous integration (CI) and
assess #2 qualitatively.

The goal of this project is to compare on Mac and linux
1. Nix
   1. nixpkgs
   1. mach-nix
2. anaconda
3. pip
