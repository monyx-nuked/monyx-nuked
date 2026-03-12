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
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    devShells."x86_64-linux".default = {};
  };
}
