""-----------------------------------------------------------------------------------------------------
"General Settings
""-----------------------------------------------------------------------------------------------------
set noerrorbells  "no sounds
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set number    
set nowrap "line continues forever
set smartcase  "case sensitive searching
set noswapfile
set nobackup
"set undodir=~/.vim/undodir
"set undofile
set incsearch
set nocompatible
set laststatus=2
set relativenumber
set smartindent
set encoding=utf-8


set colorcolumn=150

filetype indent plugin on
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set mouse=""


syntax on
filetype off
filetype plugin indent on


""----------------------------------------------------------------------------------------------------------------
"Plugins
""----------------------------------------------------------------------------------------------------------------


set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'morhetz/gruvbox'
Plugin 'preservim/nerdtree'
Plugin 'Yggdroot/indentLine'
"Plugin 'neoclide/coc.nvim'
"Plugin 'AutoComplPop'
Plugin 'mattn/emmet-vim'
Plugin 'KeitaNakamura/neodark.vim'
"airline
Plugin 'sonph/onehalf', { 'rtp': 'vim' }
"Plugin 'felipec/notmuch-vim' "for email
Plugin 'ap/vim-css-color'
Plugin 'Raimondi/delimitMate'
"Plugin 'junegunn/goyo.vim'
"Plugin 'altercation/solarized'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'arcticicestudio/nord-vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
"Plugin 'tpope/vim-fugitive'
Plugin 'vim-webdevicons'
Plugin 'kyazdani42/nvim-web-devicons'
"Plugin 'lervag/vimtex', { 'tag': 'v2.15' }
"Plugin 'ryanoasis/vim-devicons'
"Plugin 'akinsho/nvim-bufferline.lua'
"Plugin 'lukas-reineke/indent-blankline.nvim'
"Plugin 'romgrk/barbar.nvim'
"Plugin 'yamatsum/nvim-cursorline'


call vundle#end()


""----------------------------------------------------------------------------------------------------------------------
"Colorscheme and GUIs
""----------------------------------------------------------------------------------------------------------------------


set showtabline=2

"colorscheme nord
"colorscheme gruvbox
colorscheme onehalfdark



set background=dark
"hi Normal guibg=NONE ctermbg=black
"autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg

"hi Cursor ctermbg=black ctermfg=yellow




"for bufferline
set termguicolors

"for indentline
let g:indentLine_char_list = ['┊']






let g:lightline = {
  \   'colorscheme': 'onehalfdark',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
    \   'filetype': 'MyFiletype',
    \   'fileformat': 'MyFileformat',
  \   }
  \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}
"also for lightline
"function! MyFiletype()
"  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
"endfunction
"function! MyFileformat()
"  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
"endfunction

""-------------------------------------------------------------------------------------------------------------
"Mappings
""-------------------------------------------------------------------------------------------------------------


let mapleader=" "
"set timeoutlen=150


nnoremap j n
nnoremap J N

"inoremap ii <Esc>
"vnoremap ii <Esc>

nnoremap t j
vnoremap t j

nnoremap n k
vnoremap n k

nnoremap s l
vnoremap s l


"copy and paste
vnoremap <C-c> "+y
map <C-p> "+P

"fuzzyfinder
map <M-f> :Files<CR>


nnoremap <leader><leader> <Esc>/<++><CR><Esc>cf>



  

"check spelling
"set spell spelllang=en_us

"save file
noremap <leader>s   :w<CR>        
vnoremap <leader>s   :w<CR>       

"run a python file
noremap <leader>p   :!python *.py<CR>        
vnoremap <leader>p   :!python *.py<CR>       

"nerdtree mappings
let NERDTreeMapOpenInTab='<C-t>'

noremap <leader>n   :NERDTree<cr>
vnoremap <leader>n   :NERDTree<cr>


"emmet maps
"let g:user_emmet_mode='n'   "only enable in normal mode
let g:user_emmet_leader_key=','


"window switching
noremap <leader>w  <C-w><C-w> 

"move a block of text
vnoremap T  :m '>+1<CR>gv=gv
vnoremap N  :m '<-2<CR>gv=gv

"run a bash command
nnoremap <leader>t  :terminal<CR>
"
"terminal remappings
tnoremap <Esc>  <C-\><C-n>

"for COC"
"source $HOME/.config/nvim/plug-config/coc.vim

"to navigate the COC list"
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"to select from COC list"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"for arabic keyboard
source $HOME/.vim/keymap/arabic-pc_utf-8.vim










" Switch to English - mapping
nnoremap <Leader>e :<C-U>call EngType()<CR>
" Switch to Arabic - mapping
nnoremap <Leader>a :<C-U>call AraType()<CR>

" Switch to English - function
function! EngType()
" To switch back from Arabic
  set keymap= " Restore default (US) keyboard layout
  set norightleft
endfunction

" Switch to Arabic - function
function! AraType()
"    set keymap=arabic-pc "Modified keymap. File in ~/.vim/keymap/
    set keymap=arabic
    set rightleft
endfunction


"for blankline
if len(nvim_list_uis())
    " your side effect code

endif

"autocommands
autocmd BufWritePost *.ms !groff -U -m hdtbl -ms -t -mpic -e *.ms -T pdf groff.pdf > groff.pdf
"autocmd BufWritePost *.tex !pdflatex test.tex
autocmd BufWritePost *.tex !tectonic test.tex --outfmt pdf
autocmd BufWritePost */home/wifiengine/.source/dwm-6.2/* !sudo make install
autocmd BufWritePost */home/wifiengine/.source/dwm/* !sudo make install
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Disable nodejs support
:let g:loaded_node_provider = 0

"Don't hide any text in Latex documents
let g:tex_conceal=""
