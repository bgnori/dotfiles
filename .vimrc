
" call pathogen#runtime_append_all_bundles()

" To Do: understand
" - quickrun, unite.vim, neocomplcache, vimshell
" - AtokX http://vim-users.jp/2009/09/hack79/

set nocompatible

filetype off
filetype plugin indent off
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
else
  set rtp+=/usr/local/go/misc/vim
  " oh!
endif

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimproc.vim', {
	      \ 'build' : {
	      \     'windows' : 'tools\\update-dll-mingw',
	      \     'cygwin' : 'make -f make_cygwin.mak',
	      \     'mac' : 'make -f make_mac.mak',
	      \     'unix' : 'make -f make_unix.mak',
	      \    },
	      \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'vim-scripts/JavaScript-Indent'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/calendar-vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'ingydotnet/yaml-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ft-clojure'
NeoBundle 'fuenor/qfixhowm', '8915c5'
" gauche
" not maintained
NeoBundle 'aharisu/vim_goshrepl'
NeoBundle 'aharisu/vim-gdev'

"NeoBundle 'mattn/habatobi-vim'

" thinca/vim-quickrun'
" NeoBundle 'kana/vim-metarw'
" NeoBundle 'ujihisa/neco-ghc/'


filetype plugin indent on
filetype on


" クリップボードから貼り付け
" inoremap <C-r>* <C-o>:set paste<CR><C-r>*<C-o>:set nopaste<CR>

set expandtab
set softtabstop=4
set shiftwidth=4
set showmatch
set smarttab
set smartindent
set tabstop=4
set backup
set autoindent
set smartcase
set wrap
set mouse=a
set ttymouse=xterm2
set ambiwidth=double

syntax enable
colorscheme evening

set backupdir=~/tmp/vim/backup
let &directory = &backupdir
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif

call system("chmod -R go-rxw " . &backupdir)

set splitbelow
set splitright
set title
set nohidden
set cursorline

"it shows statusline some thing like:"
"[utf-8 unix vim tab=4]~/.vim/rc/vimrc    [+]   line=54/60,92%"
set statusline=[%{&fileencoding}\ %{&fileformat}\ %{&filetype}\ tab=%{&tabstop}]%F%9(\ %m%r\ %)%=line=%l/%L,%P
set laststatus=2
set cmdheight=1

set encoding=utf-8
set termencoding=utf-8
"support vim: in file to open. i.e.
"vim: set expandtab fenc=cp932 ff=unix ft=txt : # この行はvimエディタのモードラインです。
set modeline

autocmd Filetype gitcommit setlocal spell textwidth=72

vmap <CR> <Plug>(gosh_repl_send_block)

" Syntastic

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
"let g:syntastic_mode_map = { 'mode': 'active',
"  \ 'active_filetypes': ['js'],
"  \ 'passive_filetypes': ['php'] }
let g:syntastic_javascript_checkers = ['jshint']
" UGH!...
let g:syntastic_jshint_exec = '~/Desktop/work/shogi-js/node_modules/jshint/bin/jshint'


" Howm
"set runtimepath += ~/.howm
let home_dir = '~/howm'
let home_filename = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let home_fileencoding = 'utf-8'
let home_fileformat = 'unix'
let QFixHowm_FileType = 'markdown'
let QFixHowm_RecentMode = 2
let QFixHowm_ReminderDefault_Schedule = 1


" " NeoBundle 'Shougo/neocomplcache'
" let g:neocomplcache_enable_at_startup = 1

" neocomplcache / gauche
" let g:neocomplete#keyword_patterns['gosh-repl'] = "[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"

" To Do:
" 1. set window width with splitted to avoid Display frame 
"   Just for full size source editting, dev and so on.
"   not for commit message etc
"
" 2. force [quickrun output] window to be v splitted for Desktop
"   Since I'm using displays in long way
"
" 3. JP input method auto activation/deactivation
"   wanna 'JP input mode'
"
"

