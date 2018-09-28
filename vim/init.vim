execute pathogen#infect()

" Simple Leader key
let mapleader = " "

" StatusLine is displayed at all times
set laststatus=2
" TabLine shows open buffers when only one tab is open
let g:airline#extensions#tabline#enabled = 1
" Use Powerline symbols in StatusLine
let g:airline_powerline_fonts = 1

set t_Co=256 " Force use of 256 colors
syntax on
colorscheme onedark

set number
set ruler
set noshowmode
set wrap
" Allow for mouse scrolling
set mouse=a
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
set undodir=~/.config/nvim/undo//
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//

set formatoptions=croqlj  " j removes comment character when joining 2 comment lines
set nojoinspaces          " removes spaces when joining lines

" show tabs / nbsp / trailing spaces
set listchars=trail:¶,nbsp:¤
set list

" Backspace can delete auto-indents, past modifications and eol
" /!\ Ctrl-H is the ascii character for Backspace. Do not remap!
set backspace=indent,eol,start

" Allow hidden buffers
" Switching to another buffer when current buffer isn't saved won't trigger
" no write since last change anymore
set hidden
" Ask for confirmation before closing unsaved buffers!
set confirm

" Play nice with file watchers like Webpack's
" Slower writes though
set backupcopy=yes

" JSX pretty syntax highlighting
let g:vim_jsx_pretty_colorful_config = 1

" Open QuickFix window on errors
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Remove trailing whitespaces in dev files
autocmd FileType ruby,cucumber,haml,html,javascript,coffee,typescript,typescriptreact,css,scss,php autocmd BufWritePre <buffer> :%s/\s\+$//e

inoremap jk <Esc>
vnoremap jk <Esc>

" Go
autocmd FileType go setlocal tabstop=4
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
autocmd FileType go nnoremap <buffer> <Leader>b :GoBuild<CR>

" Elm
let g:elm_jump_to_error = 1
let g:elm_make_show_warnings = 1
let g:elm_format_autosave = 1
autocmd BufWritePre,FileWritePre *.elm :ElmFormat

" TypeScript
autocmd FileType typescript,typescriptreact nnoremap <buffer> <Leader>b :make<CR>
autocmd FileType typescript,typescriptreact nnoremap <buffer> <Leader>d :TSDef<CR>
autocmd FileType typescript,typescriptreact nnoremap <buffer> <Leader>r :TSRefs<CR>
autocmd FileType typescript,typescriptreact nnoremap <buffer> <Leader>m :TSImport<CR>
let g:nvim_typescript#type_info_on_hold = 0
let g:nvim_typescript#signature_complete = 1
let g:nvim_typescript#diagnosticsEnable = 0

" Enable deoplete at startup for completion
let g:deoplete#enable_at_startup = 1

" Enable fzf search
set rtp+=~/bin/fzf
" Mapping to search with fzf
nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>F :Files<CR>
nnoremap <Leader>s :Lines<CR>
" Use ripgrep to search in files
"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)
"
"command! -bang -nargs=* Search
"  \ call fzf#run({
"  \ 'source': 'rg --column --no-heading --color=never --smart-case '.shellescape(<q-args>),
"  \ 'sink': 'e',
"  \ 'down': '40%',
"  \ })
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Easier search navigation
nnoremap , ;
nnoremap ; ,
vnoremap , ;
vnoremap ; ,

" Clear search results highlighting
nnoremap <C-_> :nohlsearch<CR>

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

" Prevent FileBeaggle from remapping <Leader>f
let g:filebeagle_suppress_keymaps = 1
" Reenable FileBeaggle - mapping
map <silent> - <Plug>FileBeagleOpenCurrentBufferDir
" launch Unite on files like Ctrl-P
" nmap <Leader>f :Unite -start-insert -custom-matchers=matcher_fuzzy,matcher_hide_current_file buffer file_rec/async<Return> 

" Rubocop mapping
let g:vimrubocop_keymap = 0
nnoremap <Leader>r :RuboCop<CR>

" refresh the current file
nnoremap <C-r> :edit!<Return>

" Navigate through buffers with Tab and Shift + Tab
nnoremap <Tab> :bn!<Return>
nnoremap <S-Tab> :bp!<Return>

" Close buffer
nmap <Leader>w :bwipeout<Return>
nmap <Leader>W :bwipeout!<Return>

" Copy end of line
nmap Y y$
