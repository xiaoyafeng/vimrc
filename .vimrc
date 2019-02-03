"must clone vundle before port vim!! don't forget setting rtp. 
"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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
set rtp+=~/.vim/bundle/Vundle.vim
"Start Vundle!!"
call vundle#begin()
Plugin 'fholgado/minibufexpl.vim'
Plugin 'VundleVim/vundle.vim'  
Plugin 'scrooloose/nerdtree'  
Plugin 'tpope/vim-fugitive'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mileszs/ack.vim'
Plugin 'vim-perl/vim-perl'
Plugin 'WolfgangMehner/perl-support'
Plugin 'c.vim'
Plugin 'DrawIt'
Plugin 'mhinz/vim-startify'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'itchyny/calendar.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/ListToggle'
if v:version >= 800
 Plugin 'w0rp/ale'
endif

""""""""themes"""""""""""""""
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'nanotech/jellybeans.vim'
Plugin 'rakr/vim-one'


"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype indent on 
filetype plugin on
let g:gruvbox_sign_column = 'dark0'
let g:gruvbox_vert_split = 'dark0'
colorscheme gruvbox
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
let g:winManagerWindowLayout='NERDTree|TagList,BufExplorer'

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
