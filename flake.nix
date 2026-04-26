{
  description = "frenchcards.nvim dev environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    plenary = pkgs.vimUtils.buildVimPlugin {
      name = "plenary.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "nvim-lua";
        repo  = "plenary.nvim";
        rev   = "v0.1.4";
        sha256 = "sha256-oNGCdFPNm0GoBXD1FBnt1AXV1bCORSWnVQiWL1C6Zik=";
      };
    };

    neovimWithPlenary = pkgs.neovim.override {
      configure.packages.myPlugins.start = [ plenary ];
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = [ neovimWithPlenary pkgs.git ];
    };
  };
}
