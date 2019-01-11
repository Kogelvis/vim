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

" run the python code in this buffer
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
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" YouCompleteMe settings
"let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_max_diagnostics_to_display = 30
let g:ycm_auto_trigger = 1
let g:ycm_semantic_triggers =  {
  \   'c': ['->', '.'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::'],
  \   'perl': ['->'],
  \   'php': ['->', '::'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }
let g:ycm_max_num_candidates = 50
let g:ycm_filetype_whitelist = {'*': 1}
let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'qf': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'mail': 1
      \}
let g:ycm_filter_diagnostics = {}
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_seed_identifiers_with_syntax = 0
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1
      \}
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 1
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
