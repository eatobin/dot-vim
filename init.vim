" Hi Eric! I'm really: ~/dotfiles/dot-vim/init.vim

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
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-repeat.git'

" For fzf
Plug 'https://github.com/junegunn/fzf.git', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'https://github.com/junegunn/fzf.vim.git'

call plug#end()

" Colorscheme
colorscheme slate
set colorcolumn=80

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
filetype plugin indent on
set guicursor=i:hor100-iCursor-blinkon1
au VimLeave * set guicursor=a:hor100-iCursor-blinkon1

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

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
map <leader>nt :NERDTreeToggle<CR>

" GitGutter
let g:gitgutter_enabled = 1
set updatetime=100
set signcolumn=yes:1

" terminal
:tnoremap <Esc> <C-\><C-n>

" Jump between hunks
nmap <Leader>gn <Plug>(GitGutterNextHunk)  " git next
nmap <Leader>gp <Plug>(GitGutterPrevHunk)  " git previous

" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)  " git add (chunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)   " git undo (chunk)
