{
  description = "NixOS overlay for @tildearrow's kwin-lowlatency";
  outputs = { self }: { overlay = import ./default.nix; };
}
