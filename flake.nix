{
  description = "Personal website with Vite, Nix, and Dhall";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        
        # LaTeX environment with required packages
        texlive = pkgs.texlive.combine {
          inherit (pkgs.texlive)
            scheme-medium
            fontawesome5
            sourcesanspro
            moresize
            geometry
            hyperref
            xcolor
            pgf
            textpos
            raleway;
        };

        # Resume generation derivation
        resume = pkgs.stdenv.mkDerivation {
          name = "resume";
          src = ./.;
          
          buildInputs = [
            pkgs.dhall
            pkgs.dhall-json
            texlive
          ];

          buildPhase = ''
            # Create temporary build directory
            mkdir -p $TMPDIR/resume
            cd $TMPDIR/resume

            # Extract complete LaTeX document directly from Dhall
            ${pkgs.dhall}/bin/dhall text --file $src/dhall/render/resume.dhall > resume.tex
            
            # Copy LaTeX class file
            cp $src/dhall/render/developercv.cls .
            
            # Compile LaTeX to PDF
            for i in 1 2 3; do
              pdflatex -interaction=nonstopmode resume.tex || true
            done
            
            # Check if PDF was generated
            if [ ! -f resume.pdf ]; then
              echo "Failed to generate PDF"
              exit 1
            fi
          '';

          installPhase = ''
            mkdir -p $out
            cp $TMPDIR/resume/resume.pdf $out/
          '';
        };

      in
      {
        packages = {
          inherit resume;
          default = resume;
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Node.js and npm
            nodejs_20
            nodePackages.npm

            # Dhall
            dhall
            dhall-json
            dhall-lsp-server
            jq

            # Cabal
            haskellPackages.cabal-install
            ghc
            zlib

            # LaTeX
            texlive

            # Development tools
            git
            gh
          ];

          shellHook = ''
            npm install
            echo "🚀 Development environment loaded!"
            echo "Run 'npm run dev' to start the development server"
            echo "Run 'nix build .#resume' to generate your resume PDF"
          '';
        };
      }
    );
} 