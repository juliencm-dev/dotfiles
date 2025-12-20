# Agent Guidelines for Dotfiles Repository

## Repository Structure
This is a dotfiles repository using GNU Stow for symlink management. Each top-level directory represents a tool/application configuration that can be installed with `stow <folder_name>`.

## Installation Commands
- Install specific config: `stow <folder_name>` (e.g., `stow tmux`, `stow waybar`)
- Remove config: `stow -D <folder_name>`
- Test without changes: `stow -n <folder_name>`

## File Organization
- Each application has its own directory containing the expected directory structure (e.g., `.config/app/`)
- Scripts go in `scripts/.scripts/`
- Shell scripts should be executable with proper shebang (`#!/usr/bin/env bash`)

## Code Style
- **Shell Scripts**: Use `#!/usr/bin/env bash` shebang, follow shellcheck recommendations
- **Naming**: Use lowercase with hyphens for script names (e.g., `check-updates.sh`)
- **Config Files**: Maintain existing formatting and indentation style per file type
- **Comments**: Add inline comments for complex logic in scripts

## Best Practices
- Never modify system files directly; always work within the dotfiles structure
- Test configurations with `stow -n` before applying
- Preserve existing tool-specific conventions (TOML for some, INI for others, etc.)
- When adding new configs, follow the pattern: `<tool>/.config/<tool>/config-file`
