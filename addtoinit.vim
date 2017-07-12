" Go syntax
Plug 'fatih/vim-go', { 'for': 'go' }

Plug 'zchee/deoplete-go', { 'for': 'go' }

Plug 'neomake/neomake', { 'for': ['cpp', 'c', 'go', 'java', 'javascript', 'arduino'] }

" Activate neomake.
autocmd! BufReadPost,BufWritePost * Neomake

" Real cool run command for neovim
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)
