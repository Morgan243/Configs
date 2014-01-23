#get vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#sym link colors and vimrc
ln -s `pwd`/colors "$HOME"/.vim/colors
ln -s `pwd`/.vimrc "$HOME"/.vimrc

#use vundle to install some packages (Just runs BundleInstall and q q)
vim -s install.vim

#compile YCM with clang completion (need Vim with python support)
cd "$HOME"/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
