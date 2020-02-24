let mapleader=','

call plug#begin(stdpath('data') . '/plugged')
Plug 'morhetz/gruvbox'

Plug 'haya14busa/is.vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
call plug#end()

let g:coc_global_extensions=[
  \'coc-json',
  \'coc-pairs',
  \'coc-emmet',
	\'coc-tsserver',
  \'coc-prettier',
\]

" Make clap windows appear centered on vim not buffer
let g:clap_layout = { 'relative': 'editor' }

colorscheme gruvbox

" Disable auto pairs and auto indent stuff when pasting. REALLLLLLYYYY USEFULL
set pastetoggle=<F3>

set splitright

set cursorline

" disable annoying swapfiles
set noswapfile

" hide netrw comment on top
let g:netrw_banner=0

set incsearch
set hlsearch

" Enables hidden buffers -> don't have to write current buffer before using
" goto functions
set hidden

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set updatetime=300
set shortmess+=c

command! -nargs=0 Prettier :CocCommand prettier.formatFile

function! s:OpenNetrw()
  if @% == ''
    :e .
  else
    :e %:h
  endif
endfunction

function! s:OpenNetrwInProjectRoot()
  let l:dir = finddir('.git/..', expand('%:p:h').';')

  if l:dir == ''
    echo 'No root folder found'
  else
    execute 'edit ' . l:dir
  endif
endfunction

function! s:DeleteClapFile()
  echom "deleted"
endfunction

" function! s:ClapFiler()
"   function! ClapFilerMappings()
"     echom "called mappings"
"     inoremap <silent> <buffer> <C-d> :call <SID>DeleteClapFile()<CR>
"   endfunction

"   function! RemoveClapFilerMappings()
"     echom "after"
"     aug ClapFilerMappings
"       au!
"     aug END
"   endfunction
"   aug ClapFilerMappings
"     au!
"     au filetype clap_input call ClapFilerMappings()
"     au filetype clap_input au  <buffer> call RemoveClapFilerMappings()
"   aug END
"   echom "called"
"   :Clap filer
" endfunction

" nmap <leader>f :Files <CR>
" nmap <leader>b :Buffers<CR>
" nmap <leader>l :Ag<CR>
nmap <leader>f :Clap files <CR>
nmap <leader>b :Clap buffers<CR>
nmap <leader>l :Clap grep<CR>
nmap <leader>s :Clap blines<CR>
nmap <silent> <leader>ef :call <SID>OpenNetrw()<CR>
nmap <silent> <leader>ep :call <SID>OpenNetrwInProjectRoot()<CR>
" nmap <silent> <leader>e :call <SID>ClapFiler()<CR>
nmap <leader>a :CocAction<CR>

nmap <leader>gs :Gedit :<CR>

nmap ; :

inoremap <silent><expr> <c-n> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Notify coc.nvim that enter has been pressed
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh :call CocAction('doHover')<CR>
nmap <leader>rn <Plug>(coc-rename)

nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

nmap <C-q> :quit<CR>
nmap <C-s> :write<CR>

function! s:MoveCurrentFile()
  let l:oldName = @%
  let l:newName = input("FileName: ", l:oldName)
  if (match(l:oldName, l:newName) != 0)
    execute 'silent saveas ' . l:newName
    execute 'silent !rm ' . l:oldName
  endif
endfunction

command! -nargs=0 Mv call <SID>MoveCurrentFile()
nmap <leader>mv :Mv<CR>

function! s:StartProfile()
  profile start profile.log
  profile file *
  profile func *
endfunction

command! -nargs=0 StartProfiling call <SID>StartProfile()
command! -nargs=0 StopProfiling profile stop

command! -nargs=1 EditConfig :e ~/.config/<args>
map <leader>C :EditConfig 

function s:CloseClapFnc()
  call g:clap.input.goto_win()
  call feedkeys("\<C-c>")
endfunction

command! -nargs=0 CloseClap  call <SID>CloseClapFnc()

function! s:NetrwCreateDirectory()
  let l:name = input("Directory name: ")
  silent execute  '!mkdir ' . b:netrw_curdir . '/' . l:name
  call feedkeys("\<C-l>")
endfunction

function! s:NetrwCreateFile()
  let l:name = input("File name: ")
  silent execute  '!touch ' . b:netrw_curdir . '/' . l:name
  call feedkeys("\<C-l>")
endfunction

function! s:NetrwMappings()
  silent! unmap <buffer> d
  nmap <buffer> cd :call <SID>NetrwCreateDirectory()<CR>
  nmap <buffer> cf :call <SID>NetrwCreateFile()<CR>
endfunction

autocmd filetype netrw call s:NetrwMappings()

function! s:ClapMappings()
endfunction
