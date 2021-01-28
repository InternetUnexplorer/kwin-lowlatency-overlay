self: super:

{
  plasma5Packages = super.plasma5Packages // {
    plasma5 = super.plasma5Packages.plasma5 // {
      kwin = super.lib.callPackageWith (super) ./kwin-lowlatency.nix { };
    };
  };
}
