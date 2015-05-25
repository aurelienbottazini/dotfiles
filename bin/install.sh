#!/usr/bin/env zsh

brew tap Goles/battery
brew install reattach-to-user-namespace battery

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -sf ~/projects/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/projects/dotfiles/gitignore_global ~/.gitignore_global
ln -sf ~/projects/dotfiles/screenrc ~/.screenrc
ln -sf ~/projects/dotfiles/rspec ~/.rspec
ln -sf ~/projects/dotfiles/autotest ~/.autotest
ln -sf ~/projects/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/projects/dotfiles/zshrc ~/.zshrc
ln -sf ~/projects/dotfiles/aure.zsh-theme ~/.oh-my-zsh/themes/aure.zsh-theme
ln -sf ~/projects/dotfiles/dictionaries/en_US.aff ~/Library/Spelling/en_US_aurelien.aff
ln -sf ~/projects/dotfiles/dictionaries/en_US.dic ~/Library/Spelling/en_US_aurelien.dic
ln -sf ~/projects/dotfiles/dictionaries/fr_FR.aff ~/Library/Spelling/fr_FR.aff
ln -sf ~/projects/dotfiles/dictionaries/fr_FR.dic ~/Library/Spelling/fr_FR.dic
ln -sf ~/projects/dotfiles/dictionaries/fr_FR.aff ~/Library/Spelling/fr_FR_aurelien.aff
ln -sf ~/projects/dotfiles/dictionaries/fr_FR.dic ~/Library/Spelling/fr_FR_aurelien.dic
ln -sf ~/projects/dotfiles/dictionaries/.hunspell_en_US_aurelien ~/.hunspell_en_US_aurelien
ln -sf ~/projects/dotfiles/dictionaries/.hunspell_fr_FR_aurelien ~/.hunspell_fr_FR_aurelien
