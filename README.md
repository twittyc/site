# Personal Website

A modern personal website built with Next.js, Nix, and Dhall. Features include:

- About Me section
- Resume section with on-demand PDF generation using LaTeX
- Modern, responsive design
- Built with Nix for reproducible development environments
- Configuration managed with Dhall
- Automated builds and deployments via GitHub Actions

## Development

This project uses Nix for development. To get started:

1. Install Nix:
   ```bash
   sh <(curl -L https://nixos.org/nix/install) --daemon
   ```

2. Enable flakes:
   ```bash
   mkdir -p ~/.config/nix
   echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
   ```

3. Start the development server:
   ```bash
   nix develop
   npm run dev
   ```

## License

MIT License - See LICENSE file for details