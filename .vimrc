"------------------ General settings ------------------"
set nocompatible " Be improved!
syntax enable
colorscheme desert
set backspace=indent,eol,start
let mapleader = ','
set nonumber
set hlsearch
set incsearch
set autowriteall
set splitbelow
set splitright
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//
set complete=.,w,b,u 

" Tabs and spaces at 4
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set smartindent            " It's smart, so i need this!
set autoindent             " always set autoindenting on
set copyindent             " copy the previous indentation on autoindenting
set smartcase                   " ignore case if search pattern is all lowercase

" Start every function unfolded, because i don't give a fuck about folds :P
set foldlevel=99



"------------------ Typos ------------------"
" Because i fail at letting go shift after writing a colon
abbrev Wq wq
            



"------------------ Vundle ------------------"
so ~/.vim/plugins.vim




"------------------ Mappings ------------------"

"
" All modes
"
" Easy switching between splits
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-H> <C-W><C-H>
map <C-L> <C-W><C-L>


"
" Insert mode
"
" Easy escape
imap jj <esc>
imap jk <esc>


"
" Normal mode
"
"
" Edit vimrc
nmap <Leader>ev :e ~/.vimrc<cr>

" Edit plugins file
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>

" Quick save
nmap ,w :w<cr>

" Highlight removal
nmap <Leader><space> :nohlsearch<cr>

" Quick run plugininstall
nmap <C-p><C-i> :PluginInstall<cr>

" Nerd tree toggle
nmap <C-k><C-b> :NERDTreeToggle<cr>

" CtrlP browse recent files 
nmap <C-e> :CtrlPMRUFiles<cr>

" CtrlP browse tags
nmap <Leader>r :CtrlPBufTag<cr>

" Easy edit snippets
nmap <Leader>es :e ~/.vim/snippets/

"Quickly browse to any tag/symbol in the project.
"Tip: run ctags -R to regenerated the index.
nmap <Leader>f :tag<space>

"
" Visual mode
"
"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

" Go to the bottom of a yanked selection, because that is what you want!
vmap y y`]






"------------------ Plugins ------------------"
"
" NERDTree
"
" Vim fugitive should take over!!!
let NERDTReeHijackNetrw = 0

"
" CtrlP
"
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"
" Greplace.vim
"
" Use ag for search
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"
" vim-php-cs-fixer.vim
"
let g:php_cs_fixer_level = "psr2"
nnoremap <silent><leader>pd :call PhpCsFixerFixDirectory()<cr>
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<cr>

"
" NERDCommenter
"
" Extra space for NERDCommenter
let NERDSpaceDelims=1




"------------------ Visuals ------------------"
" 256 Terminal collors yeey :D
set t_Co=256

" Left padding
hi LineNr guibg=bg
set foldcolumn=2






"------------------ Laravel-specific ------------------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :CtrlP<cr>app/
nmap <Leader><Leader>v :e resources/views/<cr>
nmap <Leader><Leader>a :e resources/assets/<cr>





"------------------ Auto-commands ------------------"
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup end





"------------------ Functions ------------------"
function! IPhpInsertUse()
	call PhpInsertUse()
	call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
	call PhpExpandClass()
	call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>