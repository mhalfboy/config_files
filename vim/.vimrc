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
map  <C-w> :tabclose<CR>

" open selected function in new tab (cscope)
nnoremap <C-\> :tabnew %<CR>g<C-]>

" shortcut to switch between .c and .h files
map <F2> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <F3> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

" shortcut to open the filename under the cursor in the new tab
map <F4> :vertical wincmd gf<CR>

" whitespaces
set listchars=tab:>-,trail:~,extends:>,precedes:<
noremap <F5> :set list!<CR>

set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}                      " Changing the statusline color
set statusline+=%2*\ %{toupper(g:currentmode[mode()])}          " Current mode
set statusline+=%1*%r%w%*                                       " Flags
set statusline+=%3*\%m\ %<%F\ %w\                               " File+path
set statusline+=\%=                                             " Space
set statusline+=\%y                                             " FileType
set statusline+=\[%{(&fenc!=''?&fenc:&enc)}]\[%{&ff}]\          " Encoding & Fileformat
set statusline+=\%-3(%{FileSize()}%)                            " File size
set statusline+=\%3p%%\ \ %l:\%2c\                             " Rownumber/total (%)

hi User1 ctermfg=White ctermbg=Red
hi User2 ctermfg=000 ctermbg=111
hi User3 ctermfg=White ctermbg=DarkGray

" set unix fileformat end lines
set ff=unix

" set insensitive case search
set ic

" Ctrl + A = select all
map <C-a> GVgg

" Set 3 lines to the cursor - when moving vertically using j/k
set so=3

" Sets how many lines of history VIM has to remember
set history=500

" When searching try to be smart about cases 
set smartcase

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" set colors of active tab
hi TabLineSel ctermfg=White ctermbg=Black

let g:currentmode={
    \ 'n'      : 'Normal ', 
    \ 'v'      : 'Visual ',
    \ 'V'      : 'Visual ',
    \ 'i'      : 'Insert ',
    \ 'R'      : 'Replace '
    \}


function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=008'
  elseif (mode() =~# '\v(v|V)')
    exe 'hi! StatusLine ctermfg=005'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=004'
  else
    exe 'hi! StatusLine ctermfg=006'
  endif

  return ''
endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return '[RO]'
  else
    return ''
endfunction


set tags=/run/media/halfboy/COMMON/STUDIA/MAGISTERKA/Practice/linux-4.18.16/tags
