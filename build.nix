{ pkgs ? import <nixpkgs> { } }:

pkgs.callPackage ./kwin-lowlatency.nix { }
