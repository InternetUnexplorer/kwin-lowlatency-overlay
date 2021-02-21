final: prev:
{
  plasma5Packages = prev.plasma5Packages // {
    plasma5 = prev.plasma5Packages.plasma5 // {
      kwin = prev.lib.callPackageWith (prev) ./kwin-lowlatency.nix { };
    };
  };
}
