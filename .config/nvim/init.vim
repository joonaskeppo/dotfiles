call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'					" defaults
Plug 'arcticicestudio/nord-vim'					" theme
Plug 'tpope/vim-fugitive'				        " Git integration
Plug 'preservim/nerdtree'				        " file explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }		" fuzzy file search
Plug 'junegunn/fzf.vim'						" NOTE: requires ripgrep for :Rg (`brew install ripgrep`)
Plug 'neoclide/coc.nvim', {'branch': 'release'}	                " code completions (requires Node.js)
Plug 'tpope/vim-repeat'                                         " 'Repeat.vim remaps . in a way that plugins can tap into it.'
Plug 'guns/vim-sexp'                                            " structural editing
Plug 'tpope/vim-sexp-mappings-for-regular-people'               " make vim-sexp more usable
Plug 'Olical/conjure', {'tag': '*'}		        	" Clojure et al support
Plug 'dense-analysis/ale'                                       " linting support
Plug 'tpope/vim-commentary'                                     " Use `gcc` to comment out a line, etc.
Plug 'tpope/vim-dispatch'					" async fun times (e.g., for vim-jack-in)
Plug 'radenling/vim-dispatch-neovim'				" Support Neovim's terminal emulator and job control with dispatch.vim
Plug 'clojure-vim/vim-jack-in'					" Jack in to Boot, Clj & Leiningen
Plug 'bakpakin/fennel.vim'					" Syntax highlighting for Fennel
Plug 'tmsvg/pear-tree'						" auto-pairing of chars like parens
Plug 'junegunn/rainbow_parentheses.vim'				" pretty self-explanatary... seems to work better than most others
Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release'}				" Parinfer! Needs Rust to build (`brew install rust`)
Plug 'vim-airline/vim-airline'					" Status line
call plug#end()

" --- customizations ---

" Assign space as leader key
nnoremap <SPACE> <Nop>
let mapleader = ' '
let maplocalleader = ','

set hidden
set cursorline 		" Highlight current line
set number		" Show line numbers
set relativenumber	" Relative line numbers
" set signcolumn=no	" Remove extraneous left margin

" NERDTree
let NERDTreeQuitOnOpen=1

" Code completions with CoC
let g:coc_global_extensions = ['coc-json', 'coc-conjure']

" Make mouse usable
set mouse=a

" Theming
set termguicolors
colorscheme nord " NOTE: make sure to add the Nord colorscheme for iTerm/whatever
set background=dark

" Remappings
nnoremap <silent> <C-n> :NERDTreeFocus<CR>
nnoremap <silent> <C-x>g :GFiles<CR>
nnoremap <silent> <C-x>f :Files<CR>
nnoremap <silent> <C-x>b :Buffers<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
" Jump through errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Clojure-specific (jack-in commands)
nnoremap <silent> <Leader>cc :Clj<CR>
nnoremap <silent> <Leader>cl :Lein<CR>
nnoremap <silent> <Leader>cb :Boot<CR>
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Rainbow parens
let g:rainbow#max_level = 16
" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" Fix files with prettier, and then ESLint.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Linting
let g:ale_linters = {
      \ 'clojure': ['clj-kondo']
      \}

" Conjure
let g:conjure#log#botright = v:true

" Parinfer
" NOTE: Running into some issues with vim-sexp usage with parinfer
" Related issue: https://github.com/eraserhd/parinfer-rust/issues/16
let g:parinfer_mode = 'smart'
