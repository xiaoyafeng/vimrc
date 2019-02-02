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
Plugin 'VundleVim/vundle.vim'  
Plugin 'scrooloose/nerdtree'  
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'vim-perl/vim-perl'
Plugin 'WolfgangMehner/perl-support'
Plugin 'c.vim'
Plugin 'taglist.vim'
Plugin 'winmanager'
Plugin 'DrawIt'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'itchyny/calendar.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype indent on 
filetype plugin on
runtime macros/matchit.vim
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_confirm_extra_conf = 0
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
