"General settings
set nowrap "line continues forever
set smartcase  "case sensitive searching
set noswapfile
set nobackup
set incsearch
set number
set relativenumber
set encoding=utf-8
set noautoindent
filetype indent plugin on
set wildmenu
set showcmd
set hlsearch
set ignorecase
syntax on
set tabstop=4 softtabstop=4
set shiftwidth=4
set splitbelow splitright
set mouse=a
"set cursorline

"Plugins
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'Yggdroot/indentLine'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'Raimondi/delimitMate'
Plugin 'arcticicestudio/nord-vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
call vundle#end()

"GUI and coloscheme
colorscheme gruvbox
set background=dark
set termguicolors
let g:indentLine_char_list = ['┊']


"Mappings
let mapleader=" "
set timeoutlen=500
nnoremap j n
nnoremap J N
nnoremap t j
vnoremap t j
nnoremap n k
vnoremap n k
nnoremap s l
vnoremap s l
vnoremap <C-c> "+y
map <C-p> "+P
map <M-f> :Files<CR>
let NERDTreeMapOpenInTab='<C-t>'
noremap <leader>n   :NERDTreeToggle<cr>
vnoremap <leader>n   :NERDTreeToggle<cr>
vnoremap T  :m '>+1<CR>gv=gv
vnoremap N  :m '<-2<CR>gv=gv
noremap <leader>ww  <C-w><C-w> 
nnoremap <leader>w-	:split<cr>
nnoremap <leader>wv	:vsplit<cr>
nnoremap <leader>wh	<C-w>h
nnoremap <leader>wt	<C-w>j
nnoremap <leader>wn	<C-w>k
nnoremap <leader>ws	<C-w>l
nmap <C-Right>	:vertical resize +3<cr>
nmap <C-Up>	:resize +3<cr>
nmap <C-Down>	:resize -3<cr>
nmap <C-Left>	:vertical resize -3<cr>
nnoremap <leader>t	:vnew term://zsh<cr>
tnoremap <Esc>  <C-\><C-n>
nnoremap <leader>gg	:G<cr>
nnoremap <leader>gs :G status<cr>
nnoremap <leader>gc :G commit<cr>

"COC
source $HOME/.config/nvim/plug-config/coc.vim
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
