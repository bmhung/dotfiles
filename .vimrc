call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'

Plug 'preservim/nerdtree'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'

Plug 'dense-analysis/ale'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

Plug 'christoomey/vim-tmux-navigator'

Plug 'yggdroot/indentline'

Plug 'jiangmiao/auto-pairs'

Plug 'alvan/vim-closetag'

Plug 'morhetz/gruvbox'

Plug 'tpope/vim-commentary'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'airblade/vim-gitgutter'

call plug#end()

:noremap <leader>y "+y
:noremap <leader>p "+p
:noremap <leader>t :BTags<CR>
:noremap <C-p> :GFiles<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

"coc-explorer
nmap <leader>e :CocCommand explorer<CR>

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

set t_ZH=[3m
set t_ZR=[23m

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

set termguicolors
let g:gruvbox_italic=1
autocmd vimenter * ++nested colorscheme gruvbox
highlight Comment cterm=italic

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

runtime vimcoc
