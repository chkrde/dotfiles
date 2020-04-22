# **Deprecated, moved to <https://github.com/chkrde/devbox>**

### Initial System:
```bash
git init --bare $HOME/.dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dotfiles config --local status.showUntrackedFiles no
```

### New System:
```bash
echo ".dotfiles" >> .gitignore
git clone --bare git@github.com:chkrde/dotfiles.git $HOME/.dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
dotfiles submodule update --init --recursive
```

### Backup existing dotfiles:
```bash
mkdir -p .dotfiles-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}
```

### Add/update submodule
```bash
dotfiles submodule add <remote> <folder>
dotfiles submodule update --init --remote
```

### Packages
```bash
sudo dpkg --set-selections < .dpkglist.txt
sudo apt-get -y update
sudo apt-get dselect-upgrade
```
