" Plug {{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

Plug 'pangloss/vim-javascript' " js
Plug 'leafgarland/typescript-vim' " ts
Plug 'peitalin/vim-jsx-typescript' " highlighting
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'Raimondi/delimitMate' " auto-completion for quotes, parens, brackets, etc.
Plug 'bling/vim-airline' " fly hi...
Plug 'vim-airline/vim-airline-themes' " ...with airline
Plug 'tpope/vim-vinegar' " directory navigation
Plug 'elzr/vim-json' " make json pretty
Plug '~/code/junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'

call plug#end()
" }} Plug

nnoremap <Space> <nop>
let mapleader = " "

syntax on

" theme {{
set t_Co=256 " still need this?
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=light
colorscheme rose-pine-moon
" }} theme

" coc {{
set updatetime=300
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-eslint', 'coc-css', 'coc-tabnine', 'coc-prettier', 'coc-rust-analyzer', 'coc-pyright']

nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <C-e> :CocList diagnostics<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> <C-o> :CocList outline<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Change the background color for Coc hover popup
highlight! link CocFloating NormalFloat
highlight! NormalFloat guibg=#907aa9
" }} coc.vim

" airline {{
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='angr'
" }} airline 

" clipboard {{
if has("clipboard")
  set clipboard=unnamedplus
endif
" }} clipboard

" fzf {{
nnoremap <C-b> :Buffers<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-g> :Files ~/src/github.com/<CR>
" }} fzf

syntax enable
filetype plugin indent on

" jsonc {{
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
" }}

" set {{
set number
" set cursorline
set cmdheight=1
set backspace=2
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//
set expandtab shiftwidth=2 softtabstop=2
set splitright
set splitbelow
set scrolloff=999
set ignorecase
" }} set

" mappings {{
inoremap <C-c> <CR><Esc>O
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

xmap ga <Plug>(EasyAlign)
" }} mappings
