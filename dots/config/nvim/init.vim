" Plug {{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

Plug 'pangloss/vim-javascript' " js
" Plug 'marijnh/tern_for_vim', { 'do': 'npm install' } " js
Plug 'leafgarland/typescript-vim' " ts
Plug 'peitalin/vim-jsx-typescript' " highlighting
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'Raimondi/delimitMate' " auto-completion for quotes, parens, brackets, etc.
Plug 'bling/vim-airline' " fly hi...
Plug 'vim-airline/vim-airline-themes' " ...with airline
Plug 'tpope/vim-vinegar' " directory navigation
Plug 'elzr/vim-json' " make json pretty
" Plug 'SirVer/ultisnips' " snippets
Plug '~/src/github.com/junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'andymass/vim-matchup' " extend match %
Plug 'junegunn/Goyo.vim' " focused writing
Plug 'neoclide/jsonc.vim' " syntax highlighting for jsonc

call plug#end()
" }} Plug

syntax on

" theme {{
set background=dark
color spacemacs
set t_Co=256 " still need this?
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" }} theme

" coc.vim {{
set updatetime=300 " for coc.vim
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-tslint-plugin', 'coc-eslint', 'coc-css', 'coc-tabnine', 'coc-prettier']
" Use K to show documentation in preview window
nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <C-e> :CocList diagnostics<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <C-o> :CocList outline<CR>

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" use :Prettier to format file
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" }} coc.vim

" goyo {{
function! s:goyo_enter()
  set linebreak
endfunction

function! s:goyo_leave()
  set nolinebreak
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }} goyo

" matchup {{
let g:loaded_matchit = 1
" }} matchup

" airline {{
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
" }} airline 

" mac clipboard {{
if has("clipboard")
  set clipboard=unnamed
endif
" }} mac clipboard

" UltiSnips {{
let g:UltiSnipsExpandTrigger="<c-x>"
" }} UltiSnips

" fzf {{
nnoremap <C-b> :Buffers<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-g> :Files ~/src/github.com/<CR>
" }} fzf

filetype plugin on
filetype plugin indent on

" jsonc {{
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
" }}

" set {{
set number
" set cursorcolumn
set cursorline
set cmdheight=1
set backspace=2
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//
set expandtab shiftwidth=2 softtabstop=2
set splitright
set splitbelow
set scrolloff=999
" }} set

" mappings {{
inoremap <C-c> <CR><Esc>O
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>
autocmd filetype netrw nnoremap <buffer> % m
nmap m %

" hlsearch
let hlstate=0
nnoremap <silent> <C-u> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<CR>
" }} mappings

let g:vim_markdown_strikethrough = 1
