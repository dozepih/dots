" Basic
" vim: set foldmarker={,} foldlevel=2 foldmethod=marker

set nocompatible
filetype off
set background=dark

"set rtp+=~/dev/dots/.vim/bundle/vundle
"call vundle#rc()

""" Bundles {
" Bundle 'gmarik/vundle'
"" Bundle 'Tagbar'
"" Bundle 'neocomplcache'
"" Bundle 'neocomplcache-snippets_complete'

" Bundle 'MarcWeber/vim-addon-mw-utils'
" Bundle 'tomtom/tlib_vim'
" Bundle 'snipmate-snippets'
" Bundle 'garbas/vim-snipmate'
" Bundle 'godlygeek/tabular'

" Bundle 'jimenezrick/vimerl'
"" Bundle 'oscarh/vimerl'
" Bundle 'statusline.vim'
"" Bundle 'scrooloose/nerdtree'
"" Bundle 'tyok/ack.vim'
"" Bundle 'nerdtree-ack'
" Bundle 'tpope/vim-fugitive'
"" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'kien/ctrlp.vim'
"" Bundle 'vim-scripts/sessionman.vim'
 "Bundle 'bufexplorer.zip'
" Bundle 'wombat256.vim'
" Bundle 'Lokaltog/vim-powerline'

" }

" General {

    function! EatChar(pat)
        let c = nr2char(getchar(0))
        return (c =~ a:pat) ? '' : c
    endfunc

    iabbr _me Tomas Pihl (tomas@pihl.org)<C-R>=EatChar('\s')<CR>
    iabbr #i< #include <><left><C-R>=EatChar('\s')<CR>
    iabbr #i" #include ""<left><C-R>=EatChar('\s')<CR>
    iabbr _t  <C-R>=strftime("%H:%M:%S")<CR><C-R>=EatChar('\s')<CR>
    iabbr _d  <C-R>=strftime("%a, %d %b %Y")<CR><C-R>=EatChar('\s')<CR>
    iabbr _dt <C-R>=strftime("%a, %d %b %Y %H:%M:%S %z")<CR><C-R>=EatChar('\s')<CR>

    let mapleader=","
    let g:mapleader=","

    filetype plugin indent on   " Automatically detect file types.

    syntax enable               " syntax highlighting
    set t_Co=256
    set term=screen-256color
    set encoding=utf-8

    set laststatus=2
"    color wombat256mod

    set foldmethod=marker

    if has('persistent_undo')
        set undodir=~/.vimundo
        set undofile                "so is persistent undo ...
        set undolevels=1000         "maximum number of changes that can be undone
        set undoreload=10000        "maximum number lines to save for undo on a buffer reload
    endif

    "  backup
    set backup
    set backupdir=~/.vimbackup
    set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
    "set nobackup
    "set nowb
    set noswapfile

    set autoread            " Reread files when changed
    set autowrite           " Always write modified buffer
    set ruler               " Show line and column number
    "set cursorline		" Hightlight the screen line
    set linebreak		" Do linebreaks
    set incsearch		" Incremental search
    set ignorecase          " No case when searching
    set hlsearch		" Hilight search
    set scrolloff=3		" Add three lines of spac%e
    set backspace=eol,start,indent
    set wildignore=*.beam,*.o,*/.git/*,*~,*.swp,*.html,*.d,*.DCD
    set wildmenu
    set number
    set modelines=1
    "set relativenumber     " Show linenumbers
    set hidden                  " Switch buffer without writing
    "set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    set history=1000                " Store a ton of history (default is 20)

" }


" Keys {
    let g:ctrlp_map='<Leader>l'     " ctrl-p
    map <C-n> :bn<cr>
    map <C-p> :bp<cr>

    nnoremap <Leader>p :set paste!<cr>
    nnoremap <Leader>sv :source $MYVIMRC<CR>
    nnoremap <leader>ev :e $MYVIMRC<cr>
    nnoremap <leader>,  :w<cr>
    nnoremap <silent> <Leader>mn :call ManPage()<CR>
    nnoremap <silent> <leader>xx :call ExeLine()<cr>

    nnoremap <leader>c :bp\|bd #<cr>

    nmap Q gpap
    nmap <SPACE> /
    inoremap jk <ESC>

    " Easier moving in tabs and windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
"}

" Formatting {
    set textwidth=79        " Width
    set colorcolumn=+1
    set expandtab           " Spaces instead of tabs
    set tabstop=8
    set softtabstop=4
    set shiftwidth=4
    set autoindent
    set smartindent

    set nowrap

    if hostname() == "snorgars"
        set shiftwidth=2
        let s:manstyle='eman '
    elseif hostname() == "mbp.local"
        set shiftwidth=4
        let s:manstyle='erl -man '
    elseif hostname() == "luft.local"
        set shiftwidth=4
        let s:manstyle='erl -man '
    elseif hostname() == "liza.local"
        set shiftwidth=4
        let s:manstyle='erl -man '
    endif


    " Colors
    hi ColorColumn ctermbg=black
    hi StatusLine ctermbg=darkblue ctermfg=white
    hi StatusLineNC ctermbg=black ctermfg=red


    hi ColorColumn ctermbg=black

    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()

    " Filetypes
    au FileType make set noexpandtab    " Use real tabs

    " Remember last position
    function! ResCur()
          if line("'\"") <= line("$")
              normal! g`"
              return 1
          endif
      endfunction

      augroup resCur
          autocmd!
          autocmd BufWinEnter * call ResCur()
      augroup END
" }

" Plugins {

    " Ctags {
    set tags=./tags;~/.vimtags
    "}

    " ctrlp {{
    let g:ctrlp_working_path_mode = 0
    nnoremap <silent> <D-t> :CtrlP<CR>
    nnoremap <silent> <D-r> :CtrlPMRU<CR>
    let g:ctrlp_custom_ignore = {
                \ 'dir': '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.beam$|\.exe$\|\.so$\|\.dll$' }
    "}}
"}

" Execute line
function! ExeLine()
    let line = getline('.')
    execute line
endfunction

" Manpage
function! ManPage()
    let word = expand("<cword>")
    if &filetype == 'erlang'
        let command = "!" . s:manstyle . word
        execute command
    endif
endfunction

" Tabular {
"inoremap <silent> = =<Esc>:call <SID>ealign()<CR>a
function! s:ealign()
    let p = '^.*=\s.*$'
    if exists(':Tabularize') && getline('.') =~# '^.*=' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^=]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*=\s*\zs.*'))
        Tabularize/=/l1
        normal! 0
        call search(repeat('[^=]*=',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction
" }
