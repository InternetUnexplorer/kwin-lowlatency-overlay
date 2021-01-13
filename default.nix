self: super:

{
  plasma5 = super.plasma5 // {
    kwin = super.lib.callPackageWith (super) ./kwin-lowlatency.nix { };
  };
}
