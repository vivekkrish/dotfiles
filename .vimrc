"===================================================================================
"         FILE:  .vimrc
"  DESCRIPTION:  My vim configuration file ~/.vimrc
"       AUTHOR:  Vivek Krishnakumar
"      VERSION:  1.0
"      CREATED:  23.05.2008
"     REVISION:  --
"===================================================================================
"
"===================================================================================
" GENERAL SETTINGS
"===================================================================================
"
" Automatically reload this file when it is modified
autocmd! BufWritePost .vimrc source $HOME/.vimrc
"-------------------------------------------------------------------------------
" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
"-------------------------------------------------------------------------------
set nocompatible
"
"-------------------------------------------------------------------------------
" Enable file type detection. Use the default filetype settings.
" Also load indent files, to automatically do language-dependent indenting.
"-------------------------------------------------------------------------------
set nocp
filetype  plugin indent on
"
"-------------------------------------------------------------------------------
" Switch syntax highlighting on.
"-------------------------------------------------------------------------------
syntax    on
"
"-------------------------------------------------------------------------------
" Insert timestamp (press F3)
"-------------------------------------------------------------------------------
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
"
"-------------------------------------------------------------------------------
" Save (press ctrl-s)
"-------------------------------------------------------------------------------
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
"
"-------------------------------------------------------------------------------
" Status line
"-------------------------------------------------------------------------------
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=\ %{fugitive#statusline()}     " indicate current git branch
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line,  character
set statusline+=%<%P                         " file position
"
"-------------------------------------------------------------------------------
" Show line number, cursor position.
"-------------------------------------------------------------------------------
set ruler
"
" Platform specific items:
" - central backup directory (has to be created)
" - default dictionary
" Uncomment your choice.
"if  has("win16") || has("win32") || has("win64") || has("win95")
"
"  runtime mswin.vim
"  set backupdir =$VIM\vimfiles\backupdir
"  set dictionary=$VIM\vimfiles\wordlists/german.list
"else
  set backupdir =$HOME/.scriptsbackup
  set dictionary=$HOME/.vim/wordlists/german.list,$HOME/.vim/wordlists/english.list
"endif
"
"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
" Search
set wrapscan   " search wrap around the end of the file
set ignorecase " ignore case search
set smartcase  " override 'ignorecase' if the search pattern contains upper case
set incsearch  " incremental search
set hlsearch   " highlight searched words
nohlsearch     " avoid highlighting when reloading vimrc
set smarttab
set expandtab					" spaces are better than tabs
set autoindent                  " copy indent from current line
set smartindent                 " smart autoindenting when starting a new line
set shiftwidth=4                " number of spaces to use for each step of indent
set showcmd                     " display incomplete commands
set tabstop=4                   " number of spaces that a <Tab> counts for
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set backup                      " keep a backup file
set browsedir=current           " which directory to use for the file browser
set complete+=k                 " scan the files given with the 'dictionary' option
set history=100000              " keep 100000 lines of command line history
set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
set nowrap                      " do not wrap lines
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set showmatch                   " show matched parantheses
set scrolloff=10
set wrap linebreak textwidth=0
set backspace=indent,eol,start
" Command completion
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                   " enhance command completion
set wildmode=list:longest,full " first 'list:longest' and second 'full'
" write file easely
nnoremap [Prefix]w :update
"
"-------------------------------------------------------------------------------
"  highlight paired brackets
"-------------------------------------------------------------------------------
highlight MatchParen ctermbg=blue guibg=lightyellow
"
"-------------------------------------------------------------------------------
" highlight word under cursor
"-------------------------------------------------------------------------------
highlight flicker cterm=bold ctermfg=red
au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'
"
"-------------------------------------------------------------------------------
" Remove any trailing whitespace that is in the file
"-------------------------------------------------------------------------------
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
"
"-------------------------------------------------------------------------------
" Save the current view (when closing file) and reload (when opening)
"------------------------------------------------------------------------------
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview
"-------------------------------------------------------------------------------
"  some additional hot keys
"-------------------------------------------------------------------------------
"     F2  -  write file without confirmation
"     F3  -  call file explorer Ex
"     F4  -  show tag under curser in the preview window (tagfile must exist!)
"     F6  -  list all errors
"     F7  -  display previous error
"     F8  -  display next error
"     F12 -  list buffers and edit n-th buffer
"-------------------------------------------------------------------------------
noremap   <silent> <F2>         :write<CR>
noremap   <silent> <F3>         :Explore<CR>
noremap   <silent> <F4>         :execute ":ptag ".expand("<cword>")<CR>
noremap   <silent> <F5>         :copen<CR>
noremap   <silent> <F6>         :cclose<CR>
noremap   <silent> <F7>         :cprevious<CR>
noremap   <silent> <F8>         :cnext<CR>
noremap            <F12>        :ls<CR>:edit #
"
inoremap  <silent> <F2>    <C-C>:write<CR>
inoremap  <silent> <F3>    <C-C>:Explore<CR>
inoremap  <silent> <F4>    <C-C>:execute ":ptag ".expand("<cword>")<CR>
inoremap  <silent> <F5>    <C-C>:copen<CR>
inoremap  <silent> <F6>    <C-C>:cclose<CR>
inoremap  <silent> <F7>    <C-C>:cprevious<CR>
inoremap  <silent> <F8>    <C-C>:cnext<CR>
inoremap           <F12>   <C-C>:ls<CR>:edit #
"
"-------------------------------------------------------------------------------
" comma always followed by a space
"-------------------------------------------------------------------------------
inoremap  ,  ,<Space>
"
"-------------------------------------------------------------------------------
" autocomplete parenthesis, (brackets) and braces
"-------------------------------------------------------------------------------
"inoremap  (  ()<Left>
"inoremap  [  []<Left>
"inoremap  {  {}<Left>
"inoremap  <  <><Left>
"inoremap  "  ""<left>
"inoremap  '  ''<left>
inoremap  s/ s///g<left><left><left>
"
"-------------------------------------------------------------------------------
" The current directory is the directory of the file in the current window.
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif
"
"-------------------------------------------------------------------------------
" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
"-------------------------------------------------------------------------------
 noremap  <silent> <s-tab>       :if &modifiable && !&readonly &&
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
inoremap  <silent> <s-tab>  <C-C>:if &modifiable && !&readonly &&
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"
"-------------------------------------------------------------------------------
" Leave the editor with Ctrl-q (KDE): Write all changed buffers and exit Vim
"-------------------------------------------------------------------------------
nnoremap  <C-q>    :wqall<CR>
"
"-------------------------------------------------------------------------------
" Shortcuts for Perltidy
"-------------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.pl,*.plx,*.pm,*.cgi,*.dbi,*.spl command! -range=% -nargs=* Tidy <line1>, <line2>!perltidy -q -pt=2 -l=100 -sfs -dws -bbs -bbc -bbb -kbl=1
"autocmd BufRead,BufNewFile *.pl,*.plx,*.pm,*.cgi,*.dbi,*.spl command! -range=% Tidy <line1>, <line2>!perltidy
autocmd BufRead,BufNewFile *.pl,*.plx,*.pm,*.cgi,*.dbi,*.spl noremap <C-F9> :Tidy<CR>
"
"-------------------------------------------------------------------------------
" Always use Unix-format new lines for new files
"-------------------------------------------------------------------------------
au BufNewFile * if !&readonly && &modifiable | set fileformat=unix | endif
"-------------------------------------------------------------------------------
"re-map rcsvers.vim keys
"-------------------------------------------------------------------------------
"map <F8> \rlog
"map <F5> \older
"map <F6> \newer
"
"-------------------------------------------------------------------------------
"rcsvers.vim Options
"-------------------------------------------------------------------------------
"let g:rvMode = 1
"let g:rvRlogOptions = '-zLT'
"let g:rvSaveSuffixType = 1
"let g:rvSaveDirectoryType = 1
"let g:rvSaveDirectoryName = '~/.rcsfiles/'
"let g:rvSaveIfPreviousRCSFileExists = 0
"let g:rvIncludeExpression = '\c\.pl\|\c\.spl\|\c\.cgi\|\c\.php\|\c\.py\|\c\.js\|\c\.conf\|\c\.ini\|\chtml\|\c\.tmpl\|\c\.java\|\c\.c\|\c\.cpp\|\c\.vim\|\crc$'
"
"-------------------------------------------------------------------------------
" helpful shortcuts
"-------------------------------------------------------------------------------
nmap ,l :set list!<CR>
map ,p :set paste<CR>i
map ,i :set nopaste<CR>i
map ,s :set invlist<CR>
map ,x :x<CR>
map ,q :q!<CR>
"-------------------------------------------------------------------------------
" solarize colorscheme
"-------------------------------------------------------------------------------
"syntax enable
"colorscheme solarized
"set background=light
