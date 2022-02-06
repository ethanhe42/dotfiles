#!/bin/bash
#TODO set email here
git config --global push.default simple
git config --global user.email "yihuihe.yh@gmail.com"
git config --global user.name "yihui-he"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout 100000'

################################ github release
file="linux-amd64-github-release"
wget https://github.com/yihui-he/images/releases/download/files/$file
mkdir $HOME/bin
chmod +x $file
mv $file $HOME/bin/github-release
rm $file

################################ setup vim
# cd
# rm .vimrc 
# ln -s ubuntu-profile/.vimrc .
 
# if [ ! -d $HOME/.vim/bundle/ ]; then
#     git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#     vim +PluginInstall +qall
#     cd ~/.vim/bundle/
# fi

# #ycm
# if [ ! -d $HOME/.vim/bundle/YouCompleteMe/ ]; then
#     cd ~/.vim/bundle/
#     git clone --recursive https://github.com/Valloric/YouCompleteMe
#     cd ~/.vim/bundle/YouCompleteMe
#     ./install.py --clang-completer
# fi

# #color
# #git clone git://github.com/altercation/vim-colors-solarized.git
# #cd vim-colors-solarized/colors
# #mkdir -p ~/.vim/colors/
# #mv solarized.vim ~/.vim/colors/
# #cd ../..
# #rm -rf vim-colors-solarized

# #python.vim
# mkdir -p ~/.vim/syntax/
# cd ~/.vim/syntax/
# wget https://github.com/yihui-he/install-cuda9-cudnn7-nccl/releases/download/tar/python.vim

# vim +'PlugInstall --sync' +qa

################################ copy dot files

for file in .tmux.conf #.git-prompt.sh .bash_profile  .ipy.py 
do
    cp $file ~/
done

sudo apt update && sudo apt install < packages.txt

pip3 install -r requirements.txt