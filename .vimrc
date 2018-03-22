" Modified by Tormenta <diego.sainzdemedrano@gmail.com>
"
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set directory=/var/tmp//
set backupdir=/var/tmp//
set undodir=/var/tmp//
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

set path+=**

syntax on
set hlsearch

set bg=dark
colorscheme elflord

set number
set mouse=a

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

augroup END

filetype plugin indent on
set autoindent		" always set autoindenting on

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

"" Lines by Tormenta

" C switch-case indentation option
set cinoptions+=:0


" General tab behavior
set expandtab tabstop=4 shiftwidth=4


" Comfy leader key
let mapleader=","


" Different indentation settings
nmap <Leader>t :set expandtab tabstop=4 shiftwidth=4<CR>
nmap <Leader>T :set noexpandtab tabstop=8 shiftwidth=8<CR>


" Formatting
nmap Q V=<CR><Esc>
nmap Qq gg=G''<CR>


" For latex compilation
nnoremap <Leader>lc :w<CR>:!pdflatex %<CR>
nnoremap <Leader>xc :w<CR>:!xelatex %<CR>
nnoremap <Leader>lc<CR> :w<CR>:!pdflatex %<CR><CR>
nnoremap <Leader>xc<CR> :w<CR>:!xelatex %<CR><CR>


" Easy toggle highlight search
nnoremap <Leader>h :set hlsearch!<CR>


" Easy moving through the tags
nnoremap <C-p> gt


" Trailing whitespace
nnoremap <Leader>rt :%s/\s\+$//e<CR>


call plug#begin()

    " Highlight cursor containing tag
    Plug 'Valloric/MatchTagAlways', { 'for': 'html' }
    " SCSS syntax highlight
    Plug 'cakebaker/scss-syntax.vim'
    " Fucking correct PHP indentation
    Plug 'captbaritone/better-indent-support-for-php-with-html', { 'for': 'php' }
    " Go tools in the editor
    Plug 'fatih/vim-go', { 'for': 'go' }
    " Bracket/quotation autoclose
    Plug 'jiangmiao/auto-pairs'
    " Autocolor hex/rgba codes
    Plug 'lilydjwg/colorizer'
    " Sweet tag completion
    Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'xml', 'eruby', 'markdown'] }
    " Nice
    Plug 'morhetz/gruvbox'
    " File tree
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    " Dem arrows in da bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " C support
    Plug 'vim-jp/vim-cpp', { 'for': 'c' }


    ""
    "" Plugin related configs
    ""

    map <Leader>n :NERDTreeToggle<CR>
    let g:NERDTreeShowHidden=1

    let g:user_emmet_mode='a'   " Set tag completion for all modes

    set laststatus=2
    let g:airline_powerline_fonts = 0
    let g:airline_powerline_left_sep = ''
    let g:airline_powerline_right_sep = ''

    " goimports on write
    let g:go_fmt_command = "goimports"
    au FileType go nmap <leader>gr <Plug>(go-run-vertical)

    " Just in case it works
    "colorscheme gruvbox

call plug#end()


"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev WQa wqa
cnoreabbrev Wqa wqa
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev Qa qa
