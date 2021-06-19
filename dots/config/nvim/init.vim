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
Plug '~/src/github.com/junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'andymass/vim-matchup' " extend match %
Plug 'junegunn/Goyo.vim' " focused writing
Plug 'neoclide/jsonc.vim' " syntax highlighting for jsonc
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/vim-easy-align'
" Plug 'vimwiki/vimwiki'

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
colorscheme stellarized
" }} theme

" coc {{
set updatetime=300
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-tslint-plugin', 'coc-eslint', 'coc-css', 'coc-tabnine', 'coc-prettier', 'coc-rls', 'coc-rust-analyzer', 'coc-go']

nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <C-e> :CocList diagnostics<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <C-o> :CocList outline<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

command! -nargs=0 Prettier :CocCommand prettier.formatFile
" }} coc.vim

" Goyo {{
function! s:goyo_enter()
  set linebreak
endfunction

function! s:goyo_leave()
  set nolinebreak
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }} Goyo

" matchup {{
let g:loaded_matchit = 1
" }} matchup

" airline {{
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='stellarized_light'
" }} airline 

" clipboard {{
if has("clipboard")
  set clipboard=unnamedplus
endif
" }} clipboard

" UltiSnips {{
let g:UltiSnipsExpandTrigger="<c-x>"
" }} UltiSnips

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

autocmd filetype netrw nnoremap <buffer> % m
nmap m %

let hlstate=0
nnoremap <silent> <C-u> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<CR>

nnoremap <C-D> "=strftime("%Y-%m-%d")<CR>P
inoremap <C-D> <C-R>=strftime("%Y-%m-%d")<CR>
" %Y-%m-%d
" }} mappings

" markdown {{
let g:vim_markdown_strikethrough = 1
autocmd filetype markdown set linebreak
" }} markdown
