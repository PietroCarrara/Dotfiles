"================= VimPlug =================
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'fatih/vim-go'
	Plug 'codelitt/vim-qtpl'
	Plug 'ap/vim-buftabline'
	Plug 'jiangmiao/auto-pairs'
	Plug 'dylanaraps/wal.vim'
	Plug 'w0rp/ale'
	Plug 'scrooloose/nerdtree'
	Plug 'alvan/vim-closetag'
	Plug 'lervag/vimtex'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'Shougo/context_filetype.vim'
	Plug 'zchee/deoplete-go', { 'do': 'make' }
"Initialize plugin system
call plug#end()

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" deoplete
let g:deoplete#enable_at_startup = 1

" Colorscheme
colorscheme wal

" Buffer list
let g:bufferline_show_bufnr = 0

" ALE
let g:ale_lint_on_enter = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '-'

" Buffer tabline
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

" Compiling
:autocmd FileType go  nnoremap <buffer> <F5> :GoBuild<Enter>
:autocmd FileType cs  nnoremap <buffer> <F5> :OmniSharpBuild<Enter>
:autocmd FileType tex nnoremap <buffer> <F5> :VimtexCompile<Enter>

" Renaming
:autocmd FileType cs nnoremap <buffer> <F2> :OmniSharpRename<Enter>

" Add to project
:autocmd FileType cs nnoremap <buffer> <F4> :OmniSharpAddToProject<Enter>

" Move trhough buffers
set hidden
nnoremap J :bnext<CR>
nnoremap K :bprev<CR>

" Omnicompletion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt-=preview

" NERDTree
nnoremap <F3> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" go-vim
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_command = "goimports"

" Omnisharp
let g:deoplete_omnisharp_exe_path   = get(g:, "deoplete_omnisharp_exe_path", '~/.local/share/nvim/plugged/deoplete-omnisharp/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe')
let g:deoplete_omnisharp_port   = get(g:, "deoplete_omnisharp_port", 9999)

" Vim-close tags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'

" Extra
:filetype indent on
:set filetype=html
:set smartindent
