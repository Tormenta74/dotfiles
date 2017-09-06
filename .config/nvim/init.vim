" NeoVim init file based on .vimrc example.
" Modified by Tormenta <diego.sainzdemedrano@gmail.com>
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2015 Mar 24
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

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
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
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
map <Leader>t :set expandtab tabstop=4 shiftwidth=4<CR>
map <Leader>T :set noexpandtab tabstop=8 shiftwidth=8<CR>
map <Leader><Leader> :set expandtab tabstop=2 shiftwidth=2<CR>
map <Leader>r :retab<CR>


" Formatting (doesn't work inmmediately)
map Q V=<CR><Esc>
map Qq gg=G''<CR>


" For latex compilation
nnoremap <Leader>lc :!pdflatex %<CR>
nnoremap <Leader>xc :!xelatex %<CR>


" Create tag fold
nnoremap <Leader>f zfat


" Easy toggle highlight search
nnoremap <Leader>h :set hlsearch!<CR>


" Easy moving through the tags
nnoremap <C-p> gt


" Trailing whitespace
nnoremap <Leader>rt :%s/\s\+$//e<CR>

call plug#begin()

    " File tree
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

    " Dark powered neo-completion
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " Code linting
    Plug 'neomake/neomake', { 'for': ['cpp', 'c', 'java', 'javascript', 'arduino'] }

    " Bracket/quotation autoclose
    Plug 'jiangmiao/auto-pairs'

    " Sweet tag completion
    Plug 'mattn/emmet-vim', { 'for': ['html', 'xml', 'eruby', 'markdown'] }

    " SCSS syntax highlight
    Plug 'cakebaker/scss-syntax.vim'

    " Highlight cursor containing tag
    Plug 'Valloric/MatchTagAlways', { 'for': 'html' }

    " LaTex live preview
    "Plug 'donRaphaco/neotex', { 'for': 'tex' }
    "Plug 'lervag/vimtex', { 'for': 'tex' }
    "Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

    " Autocolor hex/rgba codes
    Plug 'lilydjwg/colorizer'

    " Dem arrows in da bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'


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

    " Activate neomake.
    "autocmd! BufWritePost * Neomake
    let g:neomake_cpp_gxx_maker = {
       \ 'exe': 'g++',
       \ 'args': ['-Wall', '-Iinclude']
       \ }

    let g:neomake_go_gobuild_maker = {
       \ 'exe': 'go build',
       \ 'buffer_output': 1
       \ }

    let g:neomake_cpp_enabled_makers = [ 'gxx' ]
    let g:neomake_javascript_enabled_makers = [ 'eslint' ]
    let g:neomake_go_enabled_makers = [ 'gobuild' ]

    augroup neomake_neomake_build
        "autocmd! BufRead,BufWritePost *.go Neomake gobuild
        autocmd! BufWritePost *.cpp Neomake gxx
        "autocmd! BufWritePost *.js Neomake eslint
    augroup end

    map <Leader><Space>e :lopen<CR>
    map <Leader><Space>c :lclose<CR>
    map <Leader><Space>n :lnext<CR>
    map <Leader><Space>p :lprev<CR>
    map <Leader><Space><Space> :ll<CR>

    " Use deoplete.
    let g:deoplete#enable_at_startup = 1

    "let g:livepreview_previewer = 'zathura'

    colorscheme gruvbox

call plug#end()

set ls=2
let g:powerline_pycmd="py3"

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
