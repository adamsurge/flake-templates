{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    rust-overlay,
    utils,
  }:
    utils.lib.eachDefaultSystem (
      system: let
        overlays = [(import rust-overlay)];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        bevyBuildInputs = with pkgs; [
          # bevy dependencies from https://github.com/bevyengine/bevy/blob/main/docs/linux_dependencies.md#nix
          pkg-config
          udev
          alsa-lib
          vulkan-loader
          xorg.libX11
          xorg.libXcursor
          xorg.libXi
          xorg.libXrandr # To use the x11 feature
          libxkbcommon
          wayland # To use the wayland feature
        ];
      in {
        devShells.default = with pkgs;
          mkShell {
            buildInputs = [rust-bin.stable.latest.default] ++ bevyBuildInputs;

            LD_LIBRARY_PATH = lib.makeLibraryPath bevyBuildInputs;
          };
      }
    );
}
