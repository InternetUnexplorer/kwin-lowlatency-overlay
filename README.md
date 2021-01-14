# NixOS overlay for kwin-lowlatency

![Build](https://github.com/InternetUnexplorer/kwin-lowlatency-overlay/workflows/Build/badge.svg)

This is an overlay for NixOS that replaces the `kwin` package with
@tildearrow's [kwin-lowlatency][1].

## Using the overlay

At the moment, only the `nixos-unstable` and `nixos-unstable-small` channels
are supported.

Add the following to your `configuration.nix`:
```nix
{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/InternetUnexplorer/kwin-lowlatency-overlay/archive/nixos-unstable.tar.gz";
    }))
  ];
}
```

## Using the binary cache

You will probably want to use the binary cache. [Follow the instructions here
to set it up.][2]

## How the binary cache works

I've set up a GCE instance that checks the [status][3] of the
`nixos-unstable` and `nixos-unstable-small` channels roughly every two
minutes. If any of the channels have been updated then it triggers the
[build workflow][4] which builds the package and pushes it to the binary
cache.

The script used to watch the channels is available [here][5] and the
timer/service units and dispatch script are available [here][6].

Because the build runs _after_ the channel has updated, there is a small
chance that the package won't be built yet when you update your system. In
that case, you can either let it be built locally or wait 20 minutes or so
until it's ready, I guess. Feel free to sword-fight on office chairs with
your friend, go outside, or whatever you normally do when something is
compiling.

## Feedback

If the overlay or the binary cache stops working, or if you have suggestions
for how to improve them, or anything else really, please [open an issue][7].

[1]: https://github.com/tildearrow/kwin-lowlatency
[2]: https://app.cachix.org/cache/kwin-lowlatency
[3]: https://status.nixos.org
[4]: https://github.com/InternetUnexplorer/kwin-lowlatency-overlay/blob/nixos-unstable/.github/workflows/build.yml
[5]: https://github.com/InternetUnexplorer/nix-channel-watcher
[6]: https://gist.github.com/InternetUnexplorer/32afbf1c1cc862c62c7107ff10cb069f
[7]: https://github.com/InternetUnexplorer/kwin-lowlatency-overlay/issues/new
