"================= VimPlug =================
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'ap/vim-buftabline'
	Plug 'jiangmiao/auto-pairs'
	Plug 'scrooloose/nerdtree'
	Plug 'alvan/vim-closetag'
	Plug 'lervag/vimtex'
"Initialize plugin system
call plug#end()

filetype plugin on

" Buffer list
let g:bufferline_show_bufnr = 0
let g:buftabline_show = 1

" Tabs
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

set number

" === Maps ===

" Move up and down
nnoremap j gj
nnoremap k gk

" Close buffer
nnoremap <C-W> :bp\|bd #<CR>

" Move through splits
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Copy/Paste from clipboard
vnoremap y  "+y
nnoremap Y  "+yg_
nnoremap y  "+y
nnoremap yy  "+yy

vnoremap d  "+d
nnoremap d  "+d
nnoremap dd  "+dd

nnoremap p "+p
nnoremap P "+P
vnoremap p "+p
vnoremap P "+P

" Move trhough buffers
set hidden
nnoremap J :bnext<CR>
nnoremap K :bprev<CR>

" NERDTree
nnoremap <F3> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" psp-sdk header files
let $C_INCLUDE_PATH = '/usr/local/pspdev/psp/sdk/include:/usr/local/pspdev/include'

" Vim-close tags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'

" Extra
:filetype indent on
:set filetype=html
:set smartindent
