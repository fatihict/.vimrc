"------------------ General settings ------------------"
set nocompatible " Be improved!
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
" Hides buffers instead of closing them in order to keep undo history and marks
set hidden

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" Completion
set complete=.,w,b,u 
let g:SuperTabDefaultCompletionType = "<c-n>"           " Rotate from top to bottom

" Tabs and spaces at 4
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set smartindent            " It's smart, so i need this!
set autoindent             " always set autoindenting on
set copyindent             " copy the previous indentation on autoindenting
" http://stackoverflow.com/questions/7053550/disable-all-auto-indentation-in-vim
set indentexpr& " DAMN YOU AUTO INDENT!!!
set ignorecase
set smartcase              " ignore case if search pattern is all lowercase

" Start every function unfolded, because i don't give a fuck about folds :P
set foldlevel=99

" With the ‘wildmenu’ option enabled, Vim provides a navigable list of suggestions.
" We can scroll forward through the items by pressing <Tab>, <C-n>, or <Right>,
" and we can scroll backward through them with <S-Tab>, <C-p>, or <Left>.
" If you’re used to the autocomplete menu provided by zsh, you might want to
" try this instead:
set wildmenu
set wildmode=full

" By default, Vim records the last twenty commands. With memory becoming
" ever cheaper in today’s computers, we can probably afford to up this limit by
" changing the ‘history’ option. Try adding this line to your vimrc:
set history=200



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
" Ex mode / Command mode
"
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Avoid the Cursor Keys When Recalling Commands from History
" In addition to the <Up> and <Down> keys, we can also use the <C-p> and <C-n> chords
" to go backward and forward through our command history. The advantage of using
" these mappings is that we don’t need to move our hands from the home row to use
" them. But there’s a disadvantage to the <C-p> and <C-n> commands: unlike <Up> and
" <Down> , they don’t filter the command history.
" We can get the best of both by creating the following custom mappings:
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"
" Insert mode
"
" Easy escape
imap jj <esc>


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

" Toggle line numbers
nmap <C-N><C-N> :set invnumber<CR>

" jk should move up and down a line, even when the line is too long and breaks
" on a new line
nmap j gj
nmap k gk

" select the pasted block
nnoremap gp `[v`]

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
" Vim vinegar should take over!!!
let NERDTreeHijackNetrw = 0

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

"
" Easymotion
"
" Change the default easy motion mapping
nmap <Leader>s <Plug>(easymotion-s)

"
" vim-jsx
"
let g:jsx_ext_required = 0


"------------------ Visuals ------------------"

syntax enable
colorscheme desert
set background=light

" Custom highlighting, because the defaults are not custom built for me :-)..
hi Search cterm=NONE ctermfg=white ctermbg=565656
hi IncSearch cterm=NONE ctermfg=white ctermbg=565656
hi MatchParen cterm=bold ctermbg=gray ctermfg=green

" 256 Terminal collors yeey :D
set t_Co=256

" Left padding hack
hi LineNr guibg=bg
set foldcolumn=2






"------------------ Laravel-specific ------------------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :CtrlP<cr>app/
nmap <Leader><Leader>v :e resources/views/<cr>
nmap <Leader><Leader>a :e resources/assets/<cr>
nmap <Leader><Leader>p :e public/<cr>
nmap <Leader><Leader>d :e database/<cr>
nmap <Leader><Leader>t :e tests/<cr>





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

" Restore the cursor to the same location on the last edit
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
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




"------------------ Tips ------------------"

"=============== Insert mode ==============="

" <C-h> Delete back one character (backspace)

" <C-w> Delete back one word

" <C-u> Delete back to start of line

" insert normal mode: <C-o>{single_command}

" <C-r>{register} paste in insert mode from a register. 0 == yank register

" <C-r> = calculation e.g. 5 + 5 returns 10 in current position in insert mode


"=============== Visual mode ==============="

" u lowercase 

" U uppercase 

" o go to the other end of the selection

"=============== Normal mode ==============="

" s command deletes the current char and puts you in insert mode which is repeatable with the dot command

" ; command repeats the last search with f

" , command repeats the last search with f in reverse (Dit mappen naar iets anders)

" & repeat last substitution

" * search for the word under the cursor

" 180<C-x> find the first numeric digit and replace with the <count>

" 10<C-a> find the first numeric digit and increment with the <count>

" g~{motion} switch case

" gU{motion} upper case

" gu{motion} lower case

" Press q: and meet the command-line window (see :h cmdwin ).

" q/ Open the command-line window with history of searches

" ctrl-f Switch from Command-Line mode to the command-line window

"=============== Command mode / Ex mode ==============="

" <C-d> reveal a list of possible completions

" <C-r><C-w> get the word under the cursor, <C-r><C-a> to get the WORD under the cursor 

" For another application, try opening your vimrc file, place your cursor on a setting, and then type :help <C-r><C-w> to look up the documentation for that setting.

" As well as recording a history of Ex commands, Vim keeps a separate record
" of our search history. If we press / to bring up the search prompt, we can
" also scroll backward and forward through previous searches with the <Up>
" and <Down> keys. The search prompt is, after all, just another form of
" Command-Line mode.

" Now try typing :help, followed by the <Up> key. Again, this should scroll through
" previous Ex commands, but instead of showing everything, the list will be
" filtered to only include Ex commands that started with the word “help.”

" Instead, we can repeat the last Ex command by pressing @: (see :h @: )

" On Vim’s command line, the % symbol is shorthand for the current file name (see :h cmdline-special ).

" The :!{cmd} command takes on a different meaning when it’s given a range.
" The lines specified by [range] are passed as standard input for the {cmd}, and
" then the output from {cmd} overwrites the original contents of [range]. Or to
" put it another way, the [range] is filtered through the specified {cmd} (see
" :h :range! ).

" Command                  Effect
" ========================================================================
" :shell                |  Start a shell (return to Vim by typing exit)
" ------------------------------------------------------------------------
" :!{cmd}               |  Execute {cmd} with the shell
" ------------------------------------------------------------------------
" :read !{cmd}          |  Execute {cmd} in the shell and insert its standard output 
"                       |  below the cursor
" ------------------------------------------------------------------------
" :[range]write !{cmd}  |  Execute {cmd} in the shell with [range] lines as standard
"                       |  input
" ------------------------------------------------------------------------
" :[range]!{filter}     |  Filter the specified [range] through external 
"                       |  program {filter}
" ------------------------------------------------------------------------
