{
  description = "EVM backend for llvm";
  inputs.nixpkgs.url = "nixpkgs/nixos-21.11";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {
      packages = forAllSystems (system:
        let pkgs = nixpkgsFor.${system}; in
        {
          evm-llvm = pkgs.stdenv.mkDerivation {
            name = "evm-llvm";
            src = pkgs.fetchFromGitHub {
              owner = "etclabscore";
              repo = "evm_llvm";
              rev = "EVM";
              sha256 = "VPY7HjTQzY9a3OiPeP4dzkIo+dMgCINSyCGDjGZOr6w=";
              # sha256 = pkgs.lib.fakeSha256;
            };
            buildInputs = with pkgs; [
              clang # TODO: not sure we need this one?
              cmake
              icu
              ncurses6
              python
              z3
              ninja
            ];
            builder = ./builder.sh;
            meta = with pkgs.lib; {
              description = "EVM backend for LLVM";
            };
          };
        }
      );
      defaultPackage = forAllSystems (system: self.packages.${system}.evm-llvm);
    };
}
