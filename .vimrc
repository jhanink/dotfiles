set nocompatible
set hidden
set visualbell
set noerrorbells
set nobackup
set noswapfile

set wildignore+=*/tmp/*,*/app/prod/*,*/test/*,*/node_modules/*,*/dev/*,*/prod/*,**/*BAK*,*.so,*.swp,*.zip,*.gif,*.png,*.svg

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'nanotech/jellybeans.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-webdevicons'

Plug 'eddsteel/vim-vimbrant'
Plug 'henrik/vim-indexed-search'

Plug 'pangloss/vim-javascript'
Plug 'gregsexton/gitv'
Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json'
Plug 'crusoexia/vim-monokai'
Plug 'Valloric/YouCompleteMe'
Plug 'wincent/Command-T'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-interruptless'
call plug#end()


" Set color scheme and mode specific options (vimdiff or regular)
if &diff
    colorscheme jellybeans
else
"    autocmd VimEnter * NERDTree
    autocmd VimEnter * if argc() != 0 && !exists("s:std_in") | wincmd p | endif

    set background=dark
    colorscheme vimbrant
    highlight ColorColumn ctermbg=7
    highlight ColorColumn guibg=Gray
endif

" Font related items
set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ 13
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''


" Index searched settings
let g:indexed_search_numbered_only = 1


let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_section_z = '%p%%  %l:%v'
let g:hybrid_use_Xresources = 1

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
let g:EasyMotion_use_upper = 1

let g:CommandTFileScanner = 'find'
let g:CommandTSmartCase = 1
"let g:CommandTIgnoreCase = 0
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
let g:EasyMotion_enter_jump_first = 1
let NERDTreeShowHidden = 1 
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"<Leader> character
let mapleader = ","

noremap <leader>k :Explore<cr>

noremap  / <Plug>(easymotion-sn)
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap NTT :NERDTreeToggle<CR>
noremap <C-S-n> :cn<CR>
noremap <C-S-p> :cp<CR>
noremap <C-f> :NERDTreeFind<CR>
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
"noremap <C-s> :w<CR>
nnoremap zz :update<cr>

" system clipboard copy
noremap <C-c> "+y
" system clipboard cut
noremap <C-x> "+d
" system clipboard paste
noremap <C-v> "+p

filetype on

imap <D-v> ^O:set paste<Enter>^R+^O:set nopaste<Enter>

noremap <leader>t :CommandT<CR>
noremap <leader>b :CommandTBuffer<CR>
noremap <leader>r :TagbarToggle<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" let g:netrw_liststyle=3

set laststatus=2
set number
set relativenumber
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

set novisualbell
set ignorecase



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=5

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Git Gutter color changes (these need to be applied after `syntax enable`)
highlight GitGutterAdd cterm=bold ctermbg=234 ctermfg=2
highlight GitGutterChange cterm=bold ctermbg=234 ctermfg=3
highlight GitGutterDelete cterm=bold ctermbg=234 ctermfg=1
highlight GitGutterChangeDelete cterm=bold ctermbg=234 ctermfg=5


" Configure gitgutter
nmap <F9> :GitGutterLineHighlightsToggle<CR>
" let g:gitgutter_override_sign_column_highlight = 0
" let g:gitgutter_sign_column_always = 1
" highlight SignColumn ctermfg=white ctermbg=black
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '✖'
let g:gitgutter_escape_grep = 1
autocmd BufWritePost * GitGutter


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir
