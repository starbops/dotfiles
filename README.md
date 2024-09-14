# My dotfiles

- Alacritty
- Zsh
- Tmux
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

## Initialize applications

### Alacritty

1. Ensure Alacritty is installed
   ```shell
   # macOS example
   brew install alacritty
   ```

### Zsh

1. Ensure Zsh is installed
   ```shell
   # Ubuntu example
   sudo apt install zsh
   ```
2. Open a new Zsh session and press `q` to prevent the default configuration populated

### Tmux

1. Ensure Tmux is installed
   ```shell
   # macOS example
   brew install tmux
   ```
2. Start a new Tmux session
   ```shell
   tmux new -s <session-name>
   ```
3. Press `<Prefix>+I` to install the plug-ins

### Neovim

1. Ensure Neovim is installed
   ```shell
   # macOS example
   brew install neovim
   ```
2. Start Neovim, all the plug-ins should be installed by Lazy.nvim plug-in manager

