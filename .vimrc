"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F9> :call SaveInputData()<CR>
func! SaveInputData()
	exec "tabnew"
	exec 'normal "+gP'
	exec "w! /tmp/input_data"
endfunc

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'acwars/winmanager'
Plug 'acwars/vim_snipmate'
Plug 'acwars/woohoo'
Plug 'acwars/vim_markdown_toc'
Plug 'acwars/vim_completes'
Plug 'acwars/vim_dictionary'
Plug 'acwars/vim_auto_save'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/taglist.vim'
Plug 'kien/ctrlp.vim'
Plug 'lervag/vimtex'
Plug 'keitanakamura/tex-conceal.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
call plug#end()

" Sets how many lines of history VIM has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
set number

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Set characters language
let $LANG='en' 
set langmenu=en

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
colorscheme woohoo
set background=light
syntax enable 

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-w> <C-W>w
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => provide hjkl movements in Insert mode via the <Alt> modifier key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Code functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.md exec ":call SetTitle()"
func SetTitle()
		if &filetype == 'markdown'
		        call setline(1, "---") 
				call append(line("."), "title: ".expand("%")) 
				call append(line(".")+1, "author: acwars") 
				call append(line(".")+2, "date: " .strftime("%m-%d-%Y %-I:%M:%S %P")) 
				call append(line(".")+3, "modified: " .strftime("%m-%d-%Y %-I:%M:%S %P")) 
				call append(line(".")+4, "tags: ") 
				call append(line(".")+5, "categories: ") 
				call append(line(".")+6, "keywords: ") 
				call append(line(".")+7, "description: ") 
				call append(line(".")+8, "cover: ") 
				call append(line(".")+9, "hide: ") 
				call append(line(".")+10, "---")
				call append(line(".")+11, "") 
        endif

endfunc

autocmd BufNewFile * normal G

autocmd BufWrite,BufWritePre,FileWritePre   *.md	ks|call	LastModified()|'s
func LastModified()
	if line("$") > 20
		let l = 20
	else
		let l = line("$")
	endif
    if &filetype == 'markdown'
	    exe "1,".l."g/modified: /s/modified: .*/modified: ".
		    		\strftime("%m-%d-%Y %-I:%M:%S %P") . "/e"
    else
	    exe "1,".l."g/Modified: /s/Modified: .*/Modified: ".
		    		\strftime("%m-%d-%Y %-I:%M:%S %P") . "/e"
    endif

endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWidth=30
let g:AutoOpenWinManager=1
let g:NERDTree_title="[NERDTree]"
function! NERDTree_Start()
	exe 'q'
	exe 'NERDTree'
endfunction

function! NERDTree_IsValid()
	return 1
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tlist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowLineNumbers=1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'
let g:persistentBehaviour=0
let NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'find %s -type f'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimTex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk_engines = {'_':'-xelatex'}
let g:vimtex_compiler_latexrun_engines ={'_':'xelatex'}
nmap <leader>ll :VimtexCompile<cr>
nmap <leader>lt :VimtexStop<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tex-Conceal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gs :Gstatus<CR><C-w>
nnoremap <silent> <leader>gd :Gdiff<CR><C-w>
nnoremap <silent> <leader>gc :Gcommit<CR><C-w>
nnoremap <silent> <leader>gw :Gwrite<CR><C-w>
nnoremap <silent> <leader>gp :Gpush<CR><C-w>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_completes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable this plugin for filetypes, '*' for all files.
let g:vim_completes_enable_ft = {'*':1}

" source for dictionary, current or other loaded buffers, see ':help cpt'
set cpt=.,k,w,b

" don't select the first item.
set completeopt=menu,menuone,noselect

" suppress annoy messages.
set shortmess+=c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_dictionary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_auto_save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
