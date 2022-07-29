syntax on
filetype plugin indent on

set encoding=UTF-8
set tabstop=4
set guicursor=
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set number
set nowrap
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set inccommand=split
set undofile
set incsearch
set termguicolors
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set scrolloff=8
set signcolumn=yes
set cmdheight=1
set updatetime=50
set shortmess+=c
set clipboard=unnamedplus
set cursorline
set mouse=a
set splitbelow
set splitright
set title
set ttimeoutlen=0

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" 256-color support
let t_Co=256

call plug#begin()
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'ourigen/skyline.vim'
Plug 'sindrets/diffview.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

lua << EOF
require('gitsigns').setup {
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 250
    }
}
EOF

colorscheme gruvbox
highlight Normal guibg=none

let mapleader=" "

" skyline.vim
let g:skyline_fugitive=1

" telescope.nvim
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("telescope>") })<CR>

" nerdtree
nnoremap <leader>t :NERDTreeToggle<CR>

" nerdtree-git-plugin
let g:NERDTreeGitStatusUseNerdFonts=1

" nerdcommenter
let g:NERDCreateDefaultMappings=0
nnoremap <leader>cc :call nerdcommenter#Comment('x', 'toggle')<CR>

" diffview
nnoremap <leader>dh :DiffviewOpen HEAD<CR>

" create panels
nnoremap <leader>sv <C-w>v
nnoremap <leader>sh <C-w>s

" move between panels
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" move line up and down
nnoremap <leader>mj :m +1<CR>
nnoremap <leader>mk :m -2<CR>

" remember last position in file
autocmd BufReadPost * normal! g`"zv
