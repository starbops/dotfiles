# My dotfiles

- Alacritty
- Zsh
- Neovim

## Prerequisites

1. Install `git`
   ```shell
   # macOS example
   brew install git
   ```
2. Install `stow`
   ```shell
   # macOS example
   brew install stow
   ```

## Construct your environment

1. Clone the `dotfiles` repository
   ```shell
   git clone https://github.com/starbops/dotfiles.git
   ```
2. Create symbolic links with `stow`
   ```shell
   cd dotfiles/
   stow .
   ```

