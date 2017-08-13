set nocompatible
filetype off



""""""""""""""""""""""""""""""

""VUNDLE STUFF(plugins)""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" let Vundle manage YouCompleteMe

" let Vundle manage auto-pairs
Plugin 'jiangmiao/auto-pairs'

" let Vundle manage indentlines 
Plugin 'Yggdroot/indentLine'

" let Vundle manage vim-colorschemes
Plugin 'flazz/vim-colorschemes'

Plugin 'geoffharcourt/vim-matchit'

Plugin 'sukima/xmledit'

Plugin 'othree/xml.vim'

Plugin 'scrooloose/nerdcommenter'

Plugin 'scrooloose/nerdtree'

" let Vundle manage vim-indent-guides
"Plugin 'nathanaelkane/vim-indent-guides'

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
"makes snipmate use shift tab
:imap <s-tab> <Plug>snipMateNextOrTrigger 
:smap <s-tab> <Plug>snipMateNextOrTrigger

:set relativenumber

:set mouse=a

set t_Co=256
colorscheme molokai


highlight LineNr ctermfg=032
"highlight LineNr ctermfg=130
highlight Comment ctermfg=028
"highlight LineNr ctermfg=darkcyan
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
command W w
command Wq wq
let mapleader=","


let g:indentLine_color_term=242
"let g:indentLine_char = '├' 
let g:indentLine_char = '▒' 

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

