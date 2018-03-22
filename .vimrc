set nocompatible
execute pathogen#infect()
filetype plugin indent on
syntax on

if has("gui_running")
	set lines=999 columns=105
	set guifont=Source\ Code\ Pro:h14
endif

" use hybrid material theme https://github.com/kristijanhusak/vim-hybrid-material
set background=dark
colorscheme hybrid_reverse

" lightline
let g:lightline = {
        \ 'colorscheme': 'one',
        \ 'active': {
            \ 'left': [
                \ [ 'mode', 'paste' ],
                \ [ 'gitbranch', 'readonly', 'filename', 'modified' ]
            \ ],
            \ 'right': [
                \ [ 'lineinfo' ],
                \ [ 'percent' ],
                \ [ 'linter_checking', 'linter_warnings', 'linter_errors', 'linter_ok' ]
                \ ]
            \ },
            \ 'component': {
            \ 'lineinfo': ' %3l:%-2v',
        \ },
        \ 'component_function': {
            \ 'gitbranch': 'fugitive#head',
        \ }
    \ }
let g:lightline.subseparator = {
        \ 'left': '»', 'right': '«'
    \ }

" lightline-ale
let g:lightline.component_expand = {
        \ 'linter_checking': 'lightline#ale#checking',
        \ 'linter_warnings': 'lightline#ale#warnings',
        \ 'linter_errors': 'lightline#ale#errors',
        \ 'linter_ok': 'lightline#ale#ok',
    \ }
let g:lightline.component_type = {
        \ 'linter_checking': 'left',
        \ 'linter_warnings': 'warning',
        \ 'linter_errors': 'error',
        \ 'linter_ok': 'left',
    \ }

" python-syntax
let g:python_highlight_all=1

" ale
let g:ale_linters = {
        \ 'python': ['flake8', 'pylint'],
    \ }
map <leader>ale :ALEToggle<CR>

" simpylfold
let g:SimpylFold_docstring_preview=1

set laststatus=2 " always display status line
set number
set ruler
set scrolloff=10 " always show lines around cursor
set cursorline
set colorcolumn=80 " draw vertical line at olumn 80
set showmatch

set encoding=utf-8
set nobackup " disable tilde backup files
set noswapfile " disable swap files

set tabstop=4 " tabs are 4 spaces
set shiftwidth=4 " indent shift by 4 spaces
set softtabstop=4 " tab/bs inserts/deletes 4 spaces
set expandtab " replace tabs with spaces
set autoindent
set formatoptions=croql
set backspace=indent,eol,start " allow backspacing through anything

set hidden

set incsearch " enable incremental search
set hlsearch " highlight search matches

" split navigation using ctrl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" remove trailing whitespaces
function TrimWhiteSpace()
	%s/\s*$//
	''
endfunction

autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()
