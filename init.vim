" Hi Eric! I'm really: ~/dotfiles/vim/init.vim

call plug#begin('~/.config/nvim/plugged/')

Plug 'https://github.com/tomasr/molokai.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/luochen1990/rainbow.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/tpope/vim-sensible.git'
Plug 'https://github.com/ntpeters/vim-better-whitespace.git'

" For vim-hindent
Plug 'https://github.com/alx741/vim-hindent.git'

call plug#end()

" Colorscheme
set termguicolors
" set colorcolumn=80

" For Airline
let g:airline_powerline_fonts                   = 1
let g:airline_theme                             = 'powerlineish'
let g:airline#extensions#tabline#enabled        = 1
let g:airline#extensions#tabline#tab_nr_type    = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" No bell
set noerrorbells

" For Rainbow Parens
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" Basic Settings
set expandtab
set shiftwidth=2
set softtabstop=2
set hlsearch
set noswapfile
set showcmd
set noshowmode
set smartcase
set number
syntax on
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
set guicursor=i:hor100-iCursor-blinkon1
au VimLeave * set guicursor=a:hor100-iCursor-blinkon1

" Windows
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

let mapleader = "\<Space>"
map <leader>h              :call WinMove('h')<cr>
map <leader>k              :call WinMove('k')<cr>
map <leader>l              :call WinMove('l')<cr>
map <leader>j              :call WinMove('j')<cr>
map <leader>H              :wincmd H<cr>
map <leader>K              :wincmd K<cr>
map <leader>L              :wincmd L<cr>
map <leader>J              :wincmd J<cr>
map <leader>wc             :wincmd q<cr>

function! NumberRelative()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <leader>non :set number<CR>
nnoremap <leader>noff :set nonumber<CR>
nnoremap <leader>nr :call NumberRelative()<cr>

" NerdTree
let g:NERDTreeHijackNetrw = 1
map <leader>n :NERDTreeToggle<CR>


" GitGutter
let g:gitgutter_enabled = 1
set updatetime=250

" NerdCommenter
let g:NERDCustomDelimiters = {
    \ 'haskell': { 'left': '--' },
    \ }

" terminal
:tnoremap <Esc> <C-\><C-n>

" For haskell-vim
let g:hindent_command = "stack exec -- hindent"
