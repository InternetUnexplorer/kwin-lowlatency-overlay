self: super:

{
  plasma5Packages = super.plasma5Packages // {
    kwin = super.lib.callPackageWith (super) ./kwin-lowlatency.nix { };
  };
}
