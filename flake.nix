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
            raleway
            ly1;
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

            # Copy LaTeX class file
            cp $src/dhall/render/developercv.cls .

            build_resume() {
              local render_file="$1"
              local output_name="$2"

              ${pkgs.dhall}/bin/dhall text --file "$render_file" > "$output_name.tex"

              for i in 1 2 3; do
                pdflatex -interaction=nonstopmode -halt-on-error "$output_name.tex"
              done
            }

            build_resume "$src/dhall/render/resume.dhall" "resume"
            build_resume "$src/dhall/render/resume.sre.dhall" "resume-sre"
            build_resume "$src/dhall/render/resume.platform-engineer.dhall" "resume-platform-engineer"
            build_resume "$src/dhall/render/resume.cloud-devops.dhall" "resume-cloud-devops"

            for file in resume.pdf resume-sre.pdf resume-platform-engineer.pdf resume-cloud-devops.pdf; do
              if [ ! -f "$file" ]; then
                echo "Failed to generate $file"
                exit 1
              fi
            done
          '';

          installPhase = ''
            mkdir -p $out
            cp $TMPDIR/resume/resume*.pdf $out/
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
            echo "Run 'nix build .#resume' to generate your master and variant resume PDFs"
          '';
        };
      }
    );
} 
