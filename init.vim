let mapleader=' '

call plug#begin('~/.vim/plugged')
Plug 'petRUShka/vim-sage'
Plug 'jbyuki/venn.nvim'
Plug 'tpope/vim-commentary'
Plug 'luochen1990/rainbow'
Plug 'lervag/vimtex'
Plug 'tomlion/vim-solidity'
Plug 'ziglang/zig.vim'
Plug 'DagurB/transparentwolf'
Plug 'sjl/badwolf'
Plug 'tpope/vim-fugitive'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nicwest/vim-workman'
call plug#end()
filetype plugin off

set background=light
" badwolf maybe?
set showtabline=1 " will be 1 in the future
colorscheme transparentwolf

let g:zig_fmt_autosave = 0
let g:markdown_fenced_languages = ['c', 'cpp', 'rust', 'sage', 'sage.python', 'python', 'vim', 'sql', 'zig']
let g:vimtex_compiler_method = 'tectonic'
let g:vimtex_view_method = 'zathura'
let g:rainbow_active = 1

function! MdMath()
	syn region math start=/\$\$/ end=/\$\$/
	syn match math '\$[^$].\{-}\$'
	hi link math Statement
endfunction

syntax on
set shiftwidth=4
set tabstop=4

" set autoindent

set number
set showbreak=+++
set showmatch
set hlsearch
set smartcase
set ignorecase
" set nowrap
set ruler
set undolevels=100
set backspace=indent,eol,start
set path+=**

set incsearch
" set copyindent
"set preserveindent

filetype indent on
" ordering to be fixed

" from ~/additionalTODOs/todo.vim
syn	keyword	cTodo BUG CHECK COMBAK DEBUG DEPRECATED FINISH FIX FIXME HACK LOUT MARK NB NOT NOTE NOTES OPTIMIZE README REFACTOR REVIEW SYS_BOOTWIN_INSTALL SYS_RESTART SYS_SHUTDOWN SYS_TODOS TBD TEMP TEST TODO XXX ZZZ

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
nnoremap <leader>q ZQ
nnoremap <leader>z ZZ
" nnoremap <leader>v :norm! dd<CR>
nnoremap <leader>v :VBox<CR>
nnoremap <C-h> gT
nnoremap <C-l> gt
nnoremap <leader><tab> :set list!<CR>

set guicursor=i:block

autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MdMath()

" vim-commentary
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType sh setlocal commentstring=#\ %s
autocmd FileType rust setlocal commentstring=//\ %s
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType nasm setlocal commentstring=;\ %s
autocmd FileType sage.python setlocal commentstring=#\ %s
autocmd FileType gp setlocal commentstring=\\\\\ %s
autocmd FileType nroff setlocal commentstring=\\#\ %s\ \\#
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType yaml setlocal commentstring=#\ %s " fuck yaml

" keybind-based compile & run
autocmd FileType c nnoremap <leader>c :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r')<CR>
autocmd FileType c nnoremap <leader>C :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' -O3'<CR>
autocmd FileType c nnoremap <leader>r :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd FileType c nnoremap <leader>m :w <bar> exec 'make'<CR>
autocmd FileType c nnoremap <leader>n :w <bar> exec 'make normal run'<CR>
autocmd FileType nasm nnoremap <leader>m :w <bar> exec 'make'<CR>
autocmd filetype nasm nnoremap <leader>r :w <bar> exec '!./'.shellescape('%:r')<CR>
autocmd filetype python nnoremap <leader>r :w <bar> exec '!python2 '.shellescape('%')<CR>
autocmd filetype python nnoremap <leader>, :w <bar> exec '!sage -python '.shellescape('%')<CR>

" Workman stuffs
let g:workman_normal_workman = 0
let g:workman_insert_workman = 0
let g:workman_normal_qwerty = 0
let g:workman_insert_qwerty = 0

" other shit
set secure
set formatoptions+=r
let &path.="src/include,/usr/include/AL," " maybe think about what i could include here
let &path.="/src/include," " dont know if this is a good idea
autocmd BufRead,BufNewFile *.h,*.c set filetype=c " check if this is working properly
autocmd BufNew,BufRead,BufNewFile *.asm set ft=nasm
let maplocalleader=','
