" set line numbers on the left side
set nu

" tab = 4 spaces
set tabstop=4 shiftwidth=4 expandtab

" turn on syntax colors and colorscheme '~/.vim/colors/mycontrast.vim'
syntax on
colorscheme mycontrast

" highlight search
set hlsearch

" shortcuts to navigate tabs
map  <C-l> :tabn<CR>
map  <C-k> :tabp<CR>
map  <C-n> :tabnew<CR>

" shortcut to switch between .c and .h files
map <F2> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

" shortcut to open the filename under the cursor in the new tab 
map <F3> :vertical wincmd gf<CR>
