# My dotfiles

- Alacritty
- Zsh
- Tmux
- Neovim

## Prerequisites

### Build-time Dependencies

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

### Runtime Dependencies

#### Zsh

- fzf
- zoxide
- fd
- eza

#### Neovim

- python-lsp-server
  ```shell
  # macOS example
  brew install python-lsp-server
  ```
- ripgrep
  ```shell
  # macOS example
  brew install ripgrep
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

## References

- [A Guide to the Zsh Completion with Examples](https://thevaluable.dev/zsh-completion-guide-examples/)
- [jeffry.in/lightweight-intelligent-completion-in-zsh](https://jeffry.in/lightweight-intelligent-completion-in-zsh)
- [Git Completions & Tooling on the Command Line - Michael Bianco](https://mikebian.co/git-completions-tooling-on-the-command-line/)
- [delve/Documentation/installation at master · go-delve/delve](https://github.com/go-delve/delve/tree/master/Documentation/installation#macos-considerations)
- [Why there is no nvim-dapconfig](https://github.com/nvim-lua/wishlist/issues/37#issuecomment-1023363686)
- [How to debug like a PRO using Neovim 🔥](https://miguelcrespo.co/posts/how-to-debug-like-a-pro-using-neovim/)
- [vim tmux backspace ^? - Super User](https://superuser.com/questions/410864/vim-tmux-backspace/1726134#1726134)
- [Problems with SSH while in tmux · Issue #559 · gpakosz/.tmux](https://github.com/gpakosz/.tmux/issues/559#issuecomment-1366842709)
- [Handling Whitespace in Neovim](https://www.manjotbal.ca/blog/neovim-whitespace.html)
- [Configure Linting, Formatting, and Autocompletion in Neovim](https://andrewcourter.substack.com/p/configure-linting-formatting-and)
