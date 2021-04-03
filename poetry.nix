{ pkgs ? import <nixpkgs> {} }:
let
  myAppEnv = pkgs.poetry2nix.mkPoetryEnv {
    projectDir = ./.;
  };
in myAppEnv.env