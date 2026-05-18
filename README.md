# dotfiles

Personal config, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

- `ghostty`
- `k9s`
- `mise`
- `starship`
- `zed`
- `zellij`
- `zsh`

## Install

```sh
git clone <repo-url> dotfiles
cd dotfiles
brew bundle --file=Brewfile
stow -t ~ ghostty k9s mise starship zed zellij zsh
```

## Unstow

```sh
cd dotfiles
stow -D -t ~ ghostty k9s mise starship zed zellij zsh
```
