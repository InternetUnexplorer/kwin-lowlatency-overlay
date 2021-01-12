self: super:

let
  pname = "kwin-lowlatency";
  version = "5.20.5";

  kwin-lowlatency = super.plasma5.kwin.overrideAttrs (oldAttrs: {
    name = "${pname}-${version}";
    patches = (oldAttrs.patches or [ ]) ++ [
      (super.fetchpatch {
        url = "https://tildearrow.org/storage/kwin-lowlatency/kwin-lowlatency-${version}.patch";
        sha256 = "14lzv38kkypqjwgdcd8f7lm7366y7cj08l3lh8qq1b49pza0zb2w";
      })
    ];
  });

in { plasma5 = super.plasma5 // { kwin = kwin-lowlatency; }; }
