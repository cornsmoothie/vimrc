set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

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
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

""""""""""""""""""""""""""""


set nocompatible
filetype off

"makes snipmate use shift tab
:imap <s-tab> <Plug>snipMateNextOrTrigger 
:smap <s-tab> <Plug>snipMateNextOrTrigger

""""""""""""""""""""""""""""""

""VUNDLE STUFF(plugins)""

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim



let path='C:/Users/Van/$Van/vimfiles/bundle/plugins'
call vundle#begin('C:/Users/Van/$Van/vimfiles/bundle/plugins')




"call vundle#begin('$Van/vimfiles/bundle/plugins')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


""""""""""""""""""""""""""""""""

" let Vundle manage YouCompleteMe
"Plugin 'Valloric/YouCompleteMe'

" let Vundle manage auto-pairs
Plugin 'jiangmiao/auto-pairs'

" let Vundle manage indentlines 
Plugin 'Yggdroot/indentLine'

" let Vundle manage vim-colorschemes
Plugin 'flazz/vim-colorschemes'

" let Vundle manage vim-indent-guides
"Plugin 'nathanaelkane/vim-indent-guides'

" let Vundle manage matchit
" makes % jump between HTML tags
Plugin 'geoffharcourt/vim-matchit'

" let Vundle manage matchit
" auto makes close tags
Plugin 'sukima/xmledit'

Plugin 'othree/xml.vim'

Plugin 'scrooloose/nerdcommenter'

Plugin 'scrooloose/nerdtree'

Plugin 'mihaifm/vimpanel'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Optional:
Plugin 'honza/vim-snippets'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on



""""""""""""""""""""""""""""""""""""""""""""""""

""CUSTOM STUFF""

"relative line #
:set relativenumber

function! NumberToggle()
  if(&relativenumber==1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-q> :call NumberToggle()<cr>

au GUIEnter * simalt ~x

set t_Co=256
colorscheme molokai

":set guifont=Lucida_Console:h11
"
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h13:cANSI
  endif
endif

"highlight LineNr ctermfg=032
"highlight LineNr ctermfg=130
highlight Comment ctermfg=028
"highlight LineNr ctermfg=darkcyan
highlight LineNr ctermfg=blue
"highlight LineNr ctermbg=235
"set background=dark


set number
set number
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
inoremap jk <esc>
command Q q
let mapleader=","


let g:indentLine_color_term=242
"let g:indentLine_char = '├' 
"let g:indentLine_char = '▒' 

"""""""""""
"Tab for autocomplete

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

"""""

"auto open and close nerdtree

autocmd vimenter * NERDTree"

"Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

