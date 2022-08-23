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
set updatetime=50
set shortmess+=c
set clipboard=unnamedplus
set cursorline
set mouse=a
set splitbelow
set splitright
set title
set ttimeoutlen=0
set foldmethod=syntax

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
Plug 'fladson/vim-kitty'
Plug 'ourigen/skyline.vim'
Plug 'sindrets/diffview.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'rust-lang/rust.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
call plug#end()

lua << EOF
require('gitsigns').setup {
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 250,
        virt_text_pos = 'right_align'
    }
}
EOF

colorscheme gruvbox
highlight Normal guibg=none

let mapleader=" "

" skyline.vim
let g:skyline_fugitive=1

" telescope.nvim
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input(">") })<CR>

" nerdtree
nnoremap <silent> <A-t> :NERDTreeToggle<CR>

" nerdtree-git-plugin
let g:NERDTreeGitStatusUseNerdFonts=1

" nerdcommenter
let g:NERDCreateDefaultMappings=0
nnoremap <silent> <A-c> :call nerdcommenter#Comment(1, 'toggle')<CR>

" diffview
nnoremap <silent> <leader>dh :DiffviewOpen HEAD<CR>

" coc
inoremap <silent><expr> <Enter> coc#pum#visible() ? coc#pum#confirm() : "\<Enter>"
inoremap <silent><expr> <Esc> coc#pum#visible() ? coc#pum#cancel() : "\<Esc>"
nnoremap <nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
nnoremap <nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
inoremap <nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" create panels
nnoremap <A-v> <C-w>v
nnoremap <A-b> <C-w>s

" move between panels
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" resize panels
nnoremap <A-H> <C-w><
nnoremap <A-L> <C-w>>

" move line up and down
nnoremap <C-Down> :m +1<CR>
nnoremap <C-Up> :m -2<CR>

" remember last position in file
autocmd BufReadPost * normal! g`"zv
