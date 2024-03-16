`alias dotgit='/usr/bin/git --git-dir=$HOME/.dotgit/ --work-tree=$HOME'`

`echo ".dotgit" >> .gitignore`

`git clone --bare https://github.com/bmhung/dotfiles.git $HOME/.dotgit`

`dotgit config --local status.showUntrackedFiles no`

`dotgit checkout`

# dotfiles

- oh-my-zsh
- zsh-syntax-highlighting
```git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting```
- zsh-autosuggestions
```git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions```
- k
```git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k```
- zsh prompt pure
```
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
```
- nvm
  

## tmux

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

1. Add new plugin to `~/.tmux.conf` with `set -g @plugin '...'`
2. Press `prefix` +  (capital i, as in **I**nstall) to fetch the plugin.

## vim

```
brew install neovim
https://neovim.io/doc/user/nvim.html#nvim-from-vim
feline_setup
coc
```
```
git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac
```
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- Install Plug `:PlugInstall`
- Reload vim `:so %`

```
TSInstall graphql javascript tsx typescript
```
