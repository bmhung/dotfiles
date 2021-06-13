`alias dotgit='/usr/bin/git --git-dir=$HOME/.dotgit/ --work-tree=$HOME'`

`echo ".dotgit" >> .gitignore`

`git clone --bare https://github.com/bmhung/dotfiles.git $HOME/.dotgit`

`dotgit config --local status.showUntrackedFiles no`

`dotgit checkout`

# dotfiles

- oh-my-zsh
- zsh-syntax-highlighting
- zsh-autosuggestions
- zsh prompt pure
- nvm
  

## tmux

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

1. Add new plugin to `~/.tmux.conf` with `set -g @plugin '...'`
2. Press `prefix` +  (capital i, as in **I**nstall) to fetch the plugin.

## vim

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- Install Plug `:PlugInstall`
- Reload vim `:so %`
