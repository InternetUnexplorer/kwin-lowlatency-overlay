{
  description = "NixOS overlay for @tildearrow's kwin-lowlatency";

  outputs = { self, nixpkgs }: {
    overlay = import ./default.nix;

    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      callPackage ./kwin-lowlatency.nix { };
  };
}
