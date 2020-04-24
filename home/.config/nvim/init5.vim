let mapleader=','

call plug#begin(stdpath('data') . '/plugged')
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/completion-nvim'
Plug 'haorenW1025/diagnostic-nvim'
call plug#end()

" lsp setup start
lua require'nvim_lsp'.tsserver.setup{on_attach=require'diagnostic'.on_attach}
lua require'nvim_lsp'.vimls.setup{on_attach=require'diagnostic'.on_attach}
lua require'nvim_lsp'.html.setup{on_attach=require'diagnostic'.on_attach}
lua require'nvim_lsp'.cssls.setup{on_attach=require'diagnostic'.on_attach}
" lsp setup end
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

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" hide netrw comment on top
let g:netrw_banner=0

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

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gd   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
"nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>


" nmap <leader>b :Buffers<CR>
" nmap <leader>l :Ag<CR>
nmap <leader>r :Clap Rg <CR>
nmap <leader>f :Clap files <CR>
nmap <leader>b :Clap buffers<CR>
nmap <leader>l :Clap grep<CR>
nmap <leader>s :Clap blines<CR>
nmap <silent> <leader>e :Explore<CR>
nmap <leader>gs :Gedit :<CR>
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
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
