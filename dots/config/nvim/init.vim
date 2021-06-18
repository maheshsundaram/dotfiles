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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/vim-easy-align'
Plug 'ruanyl/vim-gh-line'

call plug#end()
" }} Plug

nnoremap <Space> <nop>
let mapleader = " "

syntax on

" theme {{
set t_Co=256 " still need this?
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark

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

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
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
let g:airline_theme='stellarized_dark'
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

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
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
set cursorline
" }} set

" mappings {{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

autocmd filetype netrw nnoremap <buffer> % m
nmap m %

let hlstate=0
nnoremap <silent> <C-u> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<CR>
" }} mappings

" markdown {{
let g:vim_markdown_strikethrough = 1
" }} markdown

" EasyAlign {{
xmap ga <Plug>(EasyAlign)
" }} EasyAlign

" https://github.com/davidarmstronglewis/alacritty-theme
" alacritty-theme {{
function! AlignBackground()
  let &background = ( system('alacritty-theme current') =~ "light" ? "light" : "dark" )
  hi Normal guibg=NONE ctermbg=NONE
endfunc

function! ToggleAlacrittyTheme()
  if (system('alacritty-theme current') =~ "light")
    call system('alacritty-theme change stellarized_dark')
  else
    call system('alacritty-theme change stellarized_light')
  endif
  call AlignBackground()
endfunc

nmap <leader>t :call ToggleAlacrittyTheme()<cr>

call AlignBackground()
" }} alacritty-theme
