set nocompatible              " be iMproved
filetype off                  " required!
filetype plugin indent on     " required!

set laststatus=2
syn on
set termguicolors
colorscheme monokai-phoenix

map <C-Left> :tabprevious<CR>
map! <C-Left> :tabprevious<CR>
map <C-Right> :tabnext<CR>
map! <C-Right> :tabnext<CR>
map <C-h> :tabprevious<CR>
map! <C-h> :tabprevious<CR>
map <C-l> :tabnext<CR>
map! <C-l> :tabnext<CR>

set smartindent
set ts=4
set sw=4
set sts=4
set et
set ai

" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Give line number column a different tint of background
set t_Co=256
hi Normal ctermbg=256
hi LineNr ctermbg=235 guibg=#222222
hi LineNr ctermfg=8 guifg=#777777
hi Normal ctermbg=256
set number

" Toggle paste mode
nnoremap <F5> :set paste!<CR>
inoremap <F5> <ESC>:set paste!<CR>a
inoremap jj <ESC>

" Toggle folding
" nnoremap <F9> zA
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" Show leader
set showcmd

let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

au BufRead /tmp/mutt-* set tw=72

let mapleader = "\<Space>"
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nmap <Leader><Leader> V

autocmd BufWritePre *.py :call StripTrailingWhitespaces()
autocmd BufWritePost *.py call Flake8()
let g:flake8_show_quickfix=1  " show
let g:flake8_show_in_file=1  " show
let g:flake8_show_in_gutter=1  " show
nnoremap <F8> :call flake8#Flake8UnplaceMarkers()<CR>

" Easily switch between splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" YouCompleteMe settings
"let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Add pylint3 as syntastic checker
let g:syntastic_python_checkers = ['pylint', 'flake8']

" set filetype specific settings
au FileType yaml setl ts=2 sw=2 sts=2 et ai

" Add keybinding to insert pdb breakpoint
map <Leader>p :call InsertLine()<CR>

function! InsertLine()
  let trace = expand("import pdb; pdb.set_trace()")
  execute "normal o".trace
endfunction

function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

au BufRead *access.log* setf httplog

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_theme = 'powerlineish'

"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
