{
  description = ''
    development shell for my github profile portofolio
  '';
  nixConfig = {
    extra-substituters = [
      # "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      # "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    extra-experimental-features = ["nix-command" "flakes" "pipe-operators"];
    cores = 0;
  };
  inputs = {
    ###########
    # nixpkgs #
    ###########
    nixpkgs.url = "https://flakehub.com/f/nixos/nixpkgs/0.1";
  };
  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      name = "profile-dev";
      packages = with pkgs; [
        helix
        deadnix
        nixd
        mdformat
        git
        ripgrep
        jq
        tree
        gh
      ];
      shellHook = ''
        echo "Welcome to the profile dev shell!"
        echo "System: ${system}"
      '';
    };
  };
}
