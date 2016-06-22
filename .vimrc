execute pathogen#infect()

" StatusLine is displayed at all times
set laststatus=2
" TabLine shows open buffers when only one tab is open
let g:airline#extensions#tabline#enabled = 1
" Use Powerline symbols in StatusLine
let g:airline_powerline_fonts = 1

syntax on
colorscheme onedark

set number
set ruler
set showmode
set wrap
" Incremental search
set incsearch
" Highlight search results while typing a regexp
" :noh to remove highlighting on results
set hlsearch
" Underline current substitution result
" highlight IncSearch cterm=underline

filetype plugin indent on
set autoindent
set expandtab " tabs insert spaces
set shiftwidth=2
set softtabstop=2

" More natural splits
set splitbelow
set splitright

" persistent undo
" /!\ should define &undodir
set undofile
set undodir=~/.vim/undo
set backupdir=~/.vim/backup

set formatoptions=croqlj  " j removes comment character when joining 2 comment lines
set nojoinspaces          " removes spaces when joining lines

" show tabs / nbsp / trailing spaces
" set list 

" Backspace can delete auto-indents, past modifications and eol
" /!\ Ctrl-H is the ascii character for Backspace. Do not remap!
set backspace=indent,eol,start

" Allow hidden buffers
" Switching to another buffer when current buffer isn't saved won't trigger
" no write since last change anymore
set hidden
" Ask for confirmation before closing unsaved buffers!
set confirm


" Remove trailing whitespaces in dev files
autocmd FileType ruby,cucumber,haml,html,javascript,css,scss autocmd BufWritePre <buffer> :%s/\s\+$//e


" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Keep selection when re-indenting so you can keep re-indenting
vmap > >gv
vmap < <gv

" redo
nmap <S-U> :redo<Return>

" create new tab
nmap <C-n> :tabe 

" launch Unite on files like Ctrl-P
nmap <Leader>f :Unite -start-insert -custom-matchers=matcher_fuzzy,matcher_hide_current_file buffer file_rec/async<Return> 

" refresh the current file
nmap <C-r> :edit!<Return>

" Navigate through buffers with Tab and Shift + Tab
nmap <Tab> :bn!<Return>
nmap <S-Tab> :bp!<Return>

" Close buffer
nmap <Leader>w :bdelete<Return>
nmap <Leader>W :bdelete!<Return>
