"---------------------General Vim Settings--------------------------

" disable the default Vim startup message.
set shortmess+=I
" show line numbers.
set number
" line number
set relativenumber
" always show the status line at the bottom, even if you only have one window open.
set laststatus=2
" backspace over anything.
set backspace=indent,eol,start
" search case sensitive/insensitive when sentence has caps/nocaps
set ignorecase
set smartcase
" enable searching as you type, rather than waiting till you press enter.
set incsearch
" unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' 
" disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=
" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a
" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
" sane editing
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set colorcolumn=80
if !has('nvim')
  set viminfo='25,\"50,n~/.viminfo
else
  set viminfo+=n~/.shada
endif
filetype plugin indent on
set smartindent
set autoindent
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
nnoremap ,1 :set tabstop=2<CR>
nnoremap ,2 :set shiftwidth=2<CR>
" css autocompletion
set omnifunc=syntaxcomplete#Complete
" window
set splitbelow
set splitright
map <C> <C-W>
" tabs
map ,t :tabnew 
map ,e :tabedit
map ,h :tabfirst
map ,j :tabprev
map ,k :tabnext
map ,l :tablast
map ,x :tabclose
" buffer
nnoremap <Leader>[ :bp!<CR>
nnoremap <Leader>] :bn!<CR>
" misc
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>np :set nopaste<CR>
" insert line above with going into insert mode
nmap <leader>O O<ESC>
" auto set working dir
set autochdir
" terminal
nmap <Leader>t :split term://zsh<CR>:resize 10<CR><CR>
:tnoremap <Esc> <C-\><C-n>

"--------------------- Plugins --------------------------
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'preservim/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'romkatv/powerlevel10k'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tomlion/vim-solidity'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'EdenEast/nightfox.nvim'
call plug#end()


"--------------------- Plugin Settings --------------------------
syntax on
colorscheme nordfox
let g:airline_theme='night_owl'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
"git
nnoremap /gd :!git diff<CR>
nnoremap /gs :!git status<CR>
"fzf
set rtp+=/usr/local/opt/fzf
nnoremap <silent><nowait> <space>f :FZF<CR>
nnoremap <silent><nowait> <space>r :Rg<CR>
function! FZFWithDirArgs(path)
  execute ':FZF' a:path
endfunction
nnoremap <silent><space>d :call FZFWithDirArgs(input('Param: '))<CR>
"powerline fonts
let g:airline_powerline_fonts = 1
"nerdtree tabs
map <Leader>R :NERDTreeFocus<CR>R<c-w><c-p>
map <Leader>N <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1
"nerd commenter
let g:NERDTrimTrailingWhitespace = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
"emmet
let g:user_emmet_leader_key=','
" coc nvim
let g:python3_host_prog = '/usr/bin/python3'
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=1
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB> 
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,python,go setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" coc-git
" navigate conflicts of current buffer
nmap /[c <Plug>(coc-git-prevconflict)
nmap /]c <Plug>(coc-git-nextconflict)
" show commit contains current position
nmap /gc <Plug>(coc-git-commit)
" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
