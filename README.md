# dotfiles
dotfiles :D

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
config config --local status.showUntrackedFiles no
```

### Backup existing dotfiles:
```bash
mkdir -p .dotfiles-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}
```
