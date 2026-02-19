# Resume Builder

A modern, type-safe resume builder that uses Dhall for configuration and generates both a LaTeX PDF resume and a React website.

## Architecture

This project uses a unique architecture that combines several powerful technologies:

### Dhall Configuration
- Uses Dhall as a higher-order abstraction layer for type-safe configuration
- Defines strongly-typed schemas for resume data, including:
  - Job history
  - Skills and buzzwords
  - Contact information
  - Notable contributions
- Generates both LaTeX and JSON outputs from a single source of truth

### Build System
- Uses Nix Flakes for reproducible development environments
- Provides a consistent build environment across different machines
- Includes all necessary dependencies:
  - Dhall and Dhall-json for configuration processing
  - LaTeX with required packages for PDF generation
  - Node.js and npm for website development
  - Development tools (git, gh, etc.)

### Output Formats
1. **LaTeX Resume**
   - Generates a master PDF resume plus role-specific variants
   - Variants are selected from a tagged master data model for:
     - SRE
     - Platform Engineer
     - Cloud Engineer / DevOps
   - Uses a custom LaTeX template
   - Build with: `nix build .#resume`
   - Master data file: `dhall/data/masterResume.dhall`
   - Variant selector file: `dhall/data/variants.dhall`

2. **React Website**
   - Modern web interface built with Vite + React
   - Uses the same Dhall configuration
   - Features a responsive design with Tailwind CSS
   - Includes interactive components from shadcn/ui

## Development

### Prerequisites
- Nix package manager
- Git

### Getting Started
1. Clone the repository
2. Enter the development shell:
   ```bash
   nix develop
   ```
3. Start the development server:
   ```bash
   npm run dev
   ```

### Building
- Generate the resume PDF:
  ```bash
  nix build .#resume
  ```
  Output PDFs are written to the Nix build result directory:
  - `resume.pdf` (master)
  - `resume-sre.pdf`
  - `resume-platform-engineer.pdf`
  - `resume-cloud-devops.pdf`
- Build the website:
  ```bash
  npm run build
  ```

## CI/CD
- GitHub Actions workflows for:
  - Building and releasing resume PDFs on tags
  - Building and deploying the website from rendered JSON payload
  - Automated testing and validation

## License
MIT License
