if has("nvim")
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif
Plug 'eagletmt/ghcmod-vim',          {'for' : 'haskell'}
Plug 'eagletmt/neco-ghc',            {'for' : 'haskell'}
Plug 'neovimhaskell/haskell-vim',    {'for' : 'haskell'}
Plug 'gilligan/vim-textobj-haskell', {'for' : 'haskell'}
Plug 'Shougo/vimproc.vim',           {'do'  : 'make'}
Plug 'scrooloose/nerdtree'
" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'glts/vim-textobj-comment'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-sort-motion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'bkad/CamelCaseMotion'
Plug 'thinca/vim-localrc'
Plug 'edkolev/tmuxline.vim'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
" if has("nvim")
"   Plug 'parsonsmatt/intero-neovim'
" endif
Plug 'jgdavey/tslime.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kchmck/vim-coffee-script'
call plug#end()

"" Custom Mappings
noremap <Space> <NOP>
let mapleader = "\<Space>"

" Window navigation
nnoremap <leader>w <C-w>
nnoremap <leader>w<tab> :bprevious<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap Y y$
nnoremap <leader>t <C-]>
nnoremap <leader>sc :noh<CR>

digraphs 0+ 8853 " ⊕

"" Custom settings
set clipboard=unnamedplus

set number
set relativenumber

set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set bg=dark

" True Colors
if (has("nvim") || empty($TMUX)) && has("termguicolors")
  set termguicolors
endif

if &termguicolors
  colorscheme tender
else
  colorscheme base16-default-dark
endif

set nocursorline

set tw=80
set smartcase
set smarttab
set smartindent
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

set undofile
set title
set foldlevelstart=99

" Fix bad defaults:
syntax on
filetype plugin indent on
set nocompatible
set incsearch
set nowrap
set showmode
set t_Co=256
set wildmenu
set cmdheight=1


silent !mkdir -p ~/.vim/backups
silent !mkdir -p ~/.vim/undos
set undodir=~/.vim/undos

"" Easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" FZF
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :Lines<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" FZF Ag
function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

"" ALE
let g:airline#extensions#ale#enabled = 1
nnoremap  <Leader>ld :ALEDetail<CR>

"" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

"" Use deoplete.
let g:deoplete#enable_at_startup = 1

"" air-line
set laststatus=2
let g:airline_powerline_fonts = 1

"" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Change Cursor Shape
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

"" Rainbow Parenthesis
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"" Fugitive
set statusline+=%{fugitive#statusline()}

"" CamelCaseMotion
call camelcasemotion#CreateMotionMappings('<leader>c')

"" tslime
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars
