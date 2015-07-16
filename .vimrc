if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=/home/jkl/.vim/bundle/neobundle.vim/ 
endif
call neobundle#begin(expand('/home/jkl/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

NeoBundle 'vim-perl/vim-perl'
NeoBundle 'StanAngeloff/php.vim'

NeoBundle 'scrooloose/nerdtree'	
NeoBundle 'bling/vim-airline'
NeoBundle 'altercation/vim-colors-solarized' 

NeoBundle 'Conque-Shell'
NeoBundle 'Valloric/vim-indent-guides'

NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
call neobundle#end()
filetype plugin indent on
NeoBundleCheck	
"-------------------------------------------------------------------------
set t_Co=256
set laststatus=2
colorscheme solarized
set background=dark
let g:airline_theme='solarized'	
let g:airline_powerline_fonts = 1
syntax on
filetype plugin indent on

set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set backspace=indent,eol,start
set nu
