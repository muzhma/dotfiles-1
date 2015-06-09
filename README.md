# dotfiles


Initial Setup:
```
1.) Make the home folder on your primary system a Git repo
  cd
  git init

2.) Ignore everything by default
  echo "*" >> ~/.gitignore
  git add .gitignore

3.) Force add/commit specific files you want to track, for example:
  git add -f .zshrc
  git add -f .tmux.conf
  git add -f .Xresources
  git commit -m 'initial commit'

4.) Add and push to an online Git repo, for example:
  git remote add git@github.com:docjkl/dotfiles.git
  git push origin master
```

New system setup:
```
1.) Initialize repo
  cd
  git init
  git remote add git@github.com:docjkl/dotfiles.git

2.) Sync/overwrite local dotfiles from repo
  git fetch --all
  git reset --hard FETCH_HEAD
  git submodule update --init --recursive

(you may have to edit your .gitmodules to use relative paths)
```

<!-- echo "git pull && git submodule foreach --recursive git pull origin master" -->
