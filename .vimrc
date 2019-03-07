"set ff=unix
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
nmap <F11> :simalt ~x<CR>
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
set nowrap
"set termencoding=cp936
set termencoding=utf-8
language messages zh_CN.UTF-8
set guifont=Courier_New:h13
set nocompatible
set backspace=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set nu
set hlsearch
set iskeyword +=- 
syntax on
set autochdir
set backupdir=$TEMP
set undodir=$TEMP
filetype off
"vimPlug!!"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'fholgado/minibufexpl.vim'
Plug 'VundleVim/vundle.vim'  
Plug 'scrooloose/nerdtree'  
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'mileszs/ack.vim'
Plug 'vim-perl/vim-perl'
Plug 'WolfgangMehner/perl-support'
"Plug 'c.vim'
"Plug 'DrawIt'
Plug 'mhinz/vim-startify'
Plug 'jlanzarotta/bufexplorer'
Plug 'itchyny/calendar.vim'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/ListToggle'
Plug 'vim-scripts/a.vim'
if v:version >= 800
 Plug 'w0rp/ale'
endif

""""""""themes"""""""""""""""
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'rakr/vim-one'


"Plug 'Valloric/YouCompleteMe'
"Plug 'rdnetto/YCM-Generator'
call plug#end()            " required
"let g:gruvbox_sign_column = 'dark0'
"let g:gruvbox_vert_split = 'dark0'
"colorscheme gruvbox
noremap <F5> :NERDTreeFind<CR>
runtime macros/matchit.vim
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0

" minibufexplorer
hi MBENormal               guifg=#928374 guibg=fg ctermfg=244
hi MBEChanged              guifg=#CD5907 guibg=fg ctermfg=208
hi MBEVisibleNormal        guifg=#8ec07c guibg=fg ctermfg=72
hi MBEVisibleChanged       guifg=#CC241D guibg=fg ctermfg=124
hi MBEVisibleActiveNormal  guifg=#AFD700 guibg=fg ctermfg=142
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg ctermfg=167
" let g:miniBufExplUseSingleClick = 1
let g:miniBufExplSplitToEdge = 1
let g:miniBufExplCycleArround = 1
let g:miniBufExplBuffersNeeded = 1
let g:miniBufExplShowBufNumbers = 0
let g:did_minibufexplorer_syntax_inits = 1
noremap <F1>   :MBEbn<CR>
noremap <F2> :MBEbp<CR>
nnoremap <leader>q :call <SID>CloseOrQuitBuffer()<CR>
function! <SID>CloseOrQuitBuffer()
  let l:buf_num = len(filter(range(1, bufnr('$')), 'buflisted(v:val) && !empty(bufname(v:val))'))
  if empty(&buftype) && l:buf_num > 1
    exec ':MBEbw!'
  else
    exec 'q!'
  endif
endfunction

"tagbar settings"
let g:tagbar_width = 25
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_autoshowtag = 1
let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }
nnoremap <silent> <F6> :TagbarToggle<CR>



" nerdcommenter
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
map <silent> <C-c> <Plug>NERDCommenterSexy
nmap <silent> <C-c> <Plug>NERDCommenterComment
map <silent> <C-x> <Plug>NERDCommenterUncomment

" vim-undotree
nnoremap <F4> :UndotreeToggle<CR>
if !exists('g:undotree_WindowLayout')
  let g:undotree_WindowLayout = 3
endif

"Gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif


" ListToggle
let g:lt_quickfix_list_toggle_map = '<F2>'
let g:lt_location_list_toggle_map = '<F3>'
let g:lt_height = 10

set diffexpr=MyDiff()
function MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			if empty(&shellxquote)
				let l:shxq_sav = ''
				set shellxquote&
			endif
			let cmd = '"' . $VIMRUNTIME . '\diff"'
		else
			let cmd = substitute($vimruntime, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
	if exists('l:shxq_sav')
		let &shellxquote=l:shxq_sav
	endif
endfunction
