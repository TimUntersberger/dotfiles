let mapleader=','

call plug#begin(stdpath('data') . '/plugged')
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lilydjwg/colorizer'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'caenrique/nvim-maximize-window-toggle'

" Custom plugin
Plug '~/workspace/deta.nvim'
call plug#end()

let g:coc_global_extensions=[
  \'coc-json',
  \'coc-pairs',
  \'coc-emmet',
	\'coc-tsserver',
  \'coc-prettier',
\]

set noshowmode

let g:sneak#label = 1

" Make clap windows appear centered on vim not buffer
let g:clap_layout = { 'relative': 'editor' }

" Clap Rg provider

function! RgSource()
  return split(system('rg --files --hidden'), "\n")
endfunction

let g:clap_provider_Rg = {
      \ 'source': function("RgSource"),
      \ 'sink': 'e',
      \ }

colorscheme gruvbox

" Disable auto pairs and auto indent stuff when pasting. REALLLLLLYYYY USEFULL
set pastetoggle=<F3>

" For parcel bundler. 
set backupcopy=yes

set splitright

set cursorline

" disable annoying swapfiles
set noswapfile

" hide netrw comment on top
let g:netrw_banner=0

let g:netrw_liststyle = 3

set incsearch
set nohlsearch

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

nnoremap <C-f> :ToggleOnly<Enter>

" nmap <leader>b :Buffers<CR>
" nmap <leader>l :Ag<CR>
nmap <leader>r :Clap Rg <CR>
nmap <leader>f :Clap files <CR>
nmap <leader>b :Clap buffers<CR>
nmap <leader>l :Clap grep<CR>
nmap <leader>s :Clap blines<CR>
nmap <silent> <leader>e :Explore<CR>
nmap <leader>a :CocAction<CR>

nmap <leader>gs :Gedit :<CR>
nmap <leader>gp :Gpush <CR>

nnoremap <s-c> cc

inoremap <silent><expr> <c-n> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Notify coc.nvim that enter has been pressed
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nmap <silent> <c-c>r <Plug>(coc-refactor)
nmap <silent> <c-c>i <Plug>(coc-diagnostic-info)
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh :call CocAction('doHover')<CR>
nmap <silent> gn <Plug>(coc-rename)
nmap <silent> gw <Plug>(coc-float-jump)
nmap <silent> [e <Plug>(coc-diagnostic-prev)

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

function! s:NetrwCreateFile()
  let l:name = input("Please give file name: ")
  silent execute  '!touch ' . b:netrw_curdir . '/' . l:name
  call feedkeys("\<C-l>")
endfunction

function! s:NetrwMappings()
  nmap <buffer> f :call <SID>NetrwCreateFile()<CR>
  nmap <buffer> q :call :bd<CR>
endfunction

autocmd filetype netrw call s:NetrwMappings()
