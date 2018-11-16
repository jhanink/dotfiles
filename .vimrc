set nocompatible
set hidden
set visualbell
set noerrorbells
set nobackup
set noswapfile

set wildignore+=*/tmp/*,*/app/prod/*,*/test/*,*/node_modules/*,*/dev/*,*/prod/*,**/*BAK*,*.so,*.swp,*.zip,*.gif,*.png,*.svg

call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'
Plug 'Bling/vim-airline'
Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'Valloric/YouCompleteMe'
Plug 'wincent/Command-T'
"Plug 'dkprice/vim-easygrep'
"Plug 'tomtom/tcomment_vim'
"Plug 'L9'
"Plug 'FuzzyFinder'
"Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
"Plug 'scrooloose/syntastic'
Plug 'leafgarland/typescript-vim'
"Plug 'vim-scripts/upAndDown'
"Plug 'rizzatti/dash.vim'
"Plug 'posva/vim-vue'
"Plug 'kshenoy/vim-signature'
"Plug 'Tumbler/highlightMarks'
"Plug 'tomlion/vim-solidity'
call plug#end()

" http://vimcolors.com/
"colorscheme synic

set guifont=Input\ Mono

let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_section_z = '%p%%  %l:%v'
let g:hybrid_use_Xresources = 1
"let g:highlightMarks_colors = 'Gray'

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
let g:EasyMotion_use_upper = 1

let g:CommandTFileScanner = 'find'
let g:CommandTSmartCase = 1
"let g:CommandTIgnoreCase = 0
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
let g:EasyMotion_enter_jump_first = 1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"<Leader> character
let mapleader = ","

noremap <leader>k :Explore<cr>

noremap  / <Plug>(easymotion-sn)
noremap <C-n> :NERDTreeToggle<CR>
noremap <C-S-n> :cn<CR>
noremap <C-S-p> :cp<CR>
noremap <C-f> :NERDTreeFind<CR>
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
noremap <C-s> :w<CR>

" system clipboard copy
noremap <C-c> "+y
" system clipboard cut
noremap <C-x> "+d
" system clipboard paste
noremap <C-v> "+p

imap <C-s> <ESC>:w<CR>i
filetype on

imap <D-v> ^O:set paste<Enter>^R+^O:set nopaste<Enter>

noremap <leader>t :CommandT<CR>
noremap <leader>b :CommandTBuffer<CR>
noremap <leader>r :TagbarToggle<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

"set pastetoggle=<F10>
"inoremap <C-v> <F10><C-r>+<F10>

let g:netrw_liststyle=3

"let g:indentLine_color_gui='#F7F7F7'
"let g:indentLine_char = '|'
set laststatus=2
set number
set cursorline
set background=dark
set tabstop=4
set expandtab
set shiftwidth=2
set autoindent
set backspace=2
set scrolloff=3
set splitright
set tags=/Users/joehanink/projects/pl/tags
set ma
set title

set mouse=a

"ctrlp stuff
set hlsearch

let g:CommandTWildIgnore=&wildignore
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_quiet_messages = { "type": "style" }

" http://vignette3.wikia.nocookie.net/vim/images/1/16/Xterm-color-table.png/revision/latest?cb=20110121055231
hi CursorLine   cterm=NONE ctermbg=black guibg=black
hi CursorLineNr term=standout ctermfg=White ctermbg=Black guifg=white guibg=Linen
hi LineNr term=reverse ctermfg=darkgray guifg=LightBlue4 guibg=Black
hi TabLineFill term=bold cterm=bold ctermbg=0
hi TabLineSel ctermfg=black ctermbg=white

" Color settings.
highlight Scrollbar_Clear ctermfg=green ctermbg=black guifg=green guibg=black cterm=none
highlight Scrollbar_Thumb ctermfg=gray ctermbg=gray guifg=blue guibg=blue cterm=reverse
highlight ExtraWhitespace ctermbg=red guibg=red

au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux setw automatic-rename")
"autocmd VimLeave * call system("tmux rename-window bash")
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set title
"match ExtraWhitespace /\s\+$/


"execute pathogen#infect()
"call pathogen#helptags()

set novisualbell

