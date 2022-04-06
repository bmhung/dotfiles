let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'

" Plug 'preservim/nerdtree'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plug 'vim-airline/vim-airline'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'

Plug 'famiu/feline.nvim'

" Plug 'dense-analysis/ale'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

Plug 'christoomey/vim-tmux-navigator'

Plug 'yggdroot/indentline'

Plug 'jiangmiao/auto-pairs'

Plug 'alvan/vim-closetag'

" Plug 'morhetz/gruvbox'

Plug 'tpope/vim-commentary'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'airblade/vim-gitgutter'

Plug 'mhinz/vim-startify'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'

Plug 'projekt0n/github-nvim-theme'

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'

call plug#end()

:noremap <leader>y "+y
:noremap <leader>p "+p
:noremap <leader>t :BTags<CR>
" :noremap <C-p> :GFiles<CR>
" :noremap <C-b> :Buffer<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').resume()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
:noremap <C-p> <cmd>lua require('telescope.builtin').find_files()<CR>
:noremap <C-b> <cmd>lua require('telescope.builtin').buffers()<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

"coc-explorer
nmap <leader>e :CocCommand explorer<CR>
nnoremap <C-f> :CocCommand explorer<CR>
nnoremap <C-t> :CocCommand explorer<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>do <Plug>(coc-codeaction)

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" From thoughbot dotfiles
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline

set number
set relativenumber
set numberwidth=2

set mouse=a
set background=dark


let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'jsx': ['eslint']
\}

let g:closetag_filenames = '*.html,*.jsx'

" Italic
" set t_ZH=[3m
" set t_ZR=[23m
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
if has('termguicolors')
  set termguicolors
endif
let g:gruvbox_italic=1
" colorscheme nord
" syntax enable
colorscheme gruvbox
" autocmd vimenter * ++nested colorscheme gruvbox
highlight Comment cterm=italic

" cursor
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'

" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   highlight = {
"     enable = true,
"     additional_vim_regex_highlighting = false,
"   },
" }
" EOF

" lua <<EOF
" require('feline').setup({
"     preset = 'noicon'
" })
" EOF
:lua require('telescope').setup({ defaults = { file_ignore_patterns = { "node_modules" } } })
:lua require('nvim-web-devicons').setup({ default = true })
:lua require('gitsigns').setup()
:lua require('feline_setup')

" CoC extensions
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-snippets', 'coc-highlight', 'coc-json', 'coc-eslint' ]

runtime vimcoc
