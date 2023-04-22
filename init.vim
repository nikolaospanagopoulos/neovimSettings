set number
set clipboard=unnamed
highlight  Pmenu ctermfg=black ctermbg=LightRed    
set relativenumber
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'lfilho/cosco.vim'
Plug 'mattn/emmet-vim'
call plug#end()
let g:coc_global_extensions = [
            \'coc-emmet',
			\'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-pairs',
  \ 'coc-json',
  \'coc-go',
  \'coc-clangd'
  \ ]
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap ;<cr> <end>;<cr>
let mapleader = " "
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>pv :Vex<CR>
nnoremap <leader>ov :Files<CR>
nnoremap <leader>gv :GFiles<CR>
nnoremap <leader>ev :Ex<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
function! GenerateComment()
  let lineNumber = line('.')
  let wordUnderCursor = expand("<cword>")
  execute "normal! O\<esc>O\<esc>O\<esc>"
  call setline(lineNumber, ['/*', wordUnderCursor, '*/'])
  call cursor(lineNumber+1, strlen(wordUnderCursor))
endfunction
nnoremap <leader>g :call GenerateComment()<CR>
autocmd BufNewFile *.tmpl 0r ~/.config/nvim/templates/html.skel
autocmd FileType javascript,css,php,cpp,h,c nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
autocmd FileType javascript,css,php,cpp,h,c imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
set mouse=
