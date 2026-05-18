# Agent Profile: Ein (Local Overrides)

## 🎯 Repository Context
This repository manages Zespre's personal system configurations (dotfiles) and software packages. Supported configurations currently include `ghostty`, `k9s`, `mise`, `starship`, `zed`, `zellij`, and `zsh`.

## 🛠️ Engineering Standards

### Package Management
- **Runtime & Toolchain Priority**: Strictly prefer `mise` for managing all language runtimes (e.g., Go, Python, Node) and their associated global packages.
- **Fallback Strategy**: Only if `mise` is incapable or overly complex for a specific tool, fallback to Homebrew. As a last resort, use language-specific native tooling (e.g., `go install`, `pip install`).
- **Homebrew Integration**: Always persist new Homebrew package definitions to the `Brewfile` first.
- **Installation Execution**: Only install newly introduced Homebrew packages using `brew bundle --file=Brewfile` after the `Brewfile` has been updated.

### Commit Conventions
- **Adding Packages**: When adding a new package to the system via Homebrew, strictly use the commit format: `feat(package): add <package_name>`.
- **Tool Configurations**: When modifying a tool's configuration, scope the conventional commit to the tool's name (e.g., `feat(zsh): add new aliases`, `fix(zellij): resolve keybind conflict`).

### File Organization
- **Modularity**: Keep tool-specific configurations isolated within their dedicated directories.
- **Portability**: Prefer relative paths or standard environment variables (like `$HOME`) over hardcoded absolute paths to ensure configs remain portable.