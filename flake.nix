{
  description = ''
    development shell for my github profile portofolio
  '';
  nixConfig = {
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
