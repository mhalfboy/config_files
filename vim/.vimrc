" set line numbers on the left side
set nu

" tab = 4 spaces
set tabstop=4 shiftwidth=4 expandtab

" turn on syntax colors and colorscheme '~/.vim/colors/mycontrast.vim'
syntax on

" set colorscheme
colorscheme mycontrast

" highlight search
set hlsearch

" shortcuts to navigate tabs
map  <C-l> :tabn<CR>
map  <C-k> :tabp<CR>
map  <C-n> :tabnew<CR>

" open selected function in new tab (cscope)
nnoremap <C-\> :tabnew %<CR>g<C-]>

" shortcut to switch between .c and .h files
map <F2> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <F3> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

" shortcut to open the filename under the cursor in the new tab~
map <F4> :vertical wincmd gf<CR>

" whitespaces
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
noremap <F5> :set list!<CR>

hi User2 ctermfg=white ctermbg=red
" set status line~
"set statusline=%F[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%l/%L:%c\ %P
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%f\                          " file name
set statusline+=%h%m%2*%r%w%*                 " flags
"set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
"set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=[%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
set laststatus=2

" set unix fileformat end lines
set ff=unix

" set insensitive case search
set ic

" Ctrl + A = select all
map <C-a> GVgg
