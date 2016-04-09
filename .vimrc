"------------------ General settings ------------------"
set nocompatible " Be improved!

" Turns default plugins on
filetype plugin on

" Turn the matchit vim plugin on. This plugin lets the % also jump between xml tags.
runtime macros/matchit.vim
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

" No more swap files!
set noswapfile

" Hides buffers instead of closing them in order to keep undo history and marks
set hidden

" Add a file extension to open files with the gf command
" set suffixesadd+=.extension

" That’s where the ‘path’ option comes in ( :h 'path' ). We can configure this to
" reference a comma-separated list of directories. When we use the gf command,
" Vim checks each of the directories listed in ‘path’ to see if it contains a filename
" that matches the text under the cursor. The ‘path’ setting is also used by the
" :find command, which we covered in Tip 42, on page 96.
" We can inspect the value of the path by running this command: set path?
" In this context, the . stands for the directory of the current file, whereas the
" empty string (delimited by two adjacent commas) stands for the working
" directory. The default settings work fine for this simple example, but for a
" path=.,/usr/include,,

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='30,\"300,:100,%,n~/.viminfo

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
set history=800



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

" Now when we type %% on Vim’s : command-line prompt, it automatically expands to the path of the active buffer, just as though we had typed %:h <Tab>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

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
nmap <Leader>ev :tabedit ~/.vimrc<cr>

" Edit plugins file
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

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

" jk should move up and down a line, even when the line is too long and breaks on a new line
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" If the window is small and a line is wrapped i usually want to go to the first character of the current visible line instead of the actual line.
nnoremap 0 g0
nnoremap ^ g^
nnoremap g0 0
nnoremap g^ ^

" select the pasted block
nnoremap gp `[v`]

" Because my leader key is mapped to a comma, i can stil use the comma to reverse the f command
noremap \ ,

" Making & trigger the :&& command is more useful. It preserves flags and therefore produces more consistent results. These mappings fix the & command in Normal mode and create a Visual mode equivalent:
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Move a line of text using ALT+[jk]
" Alt keys are represented with the esc key modifier, so when i go back to normal mode pressing <esc> and follow with j or k these mapping will execute..ê
" nmap <A-k> mz:m-2<cr>`z
" nmap <A-j> mz:m+<cr>`z
" Because of these mappings i get 'weird' characters when escaping to normal mode and pressing the j key
" execute "set <M-j>=\ej"
" execute "set <M-k>=\ek"
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

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

" Break only on whole words instead of in a middle of a
" word.
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0





"------------------ Laravel-specific ------------------"
nmap <Leader><Leader>m :CtrlP<cr>app/
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
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

" <C-x><C-l> autocomplete a whole line

" <C-x><C-f> autocomplete filenames

" When we trigger an autocomplete command, Vim usually offers suggestions on how to complete the word at the current cursor position. But in the case of <C-x>s , Vim scans backward from the cursor position, stopping when it finds a misspelled word. It then builds a word list from suggested corrections and presents them in an autocomplete pop-up menu. of <C-x><C-s>



"=============== Visual mode ==============="

" u lowercase 

" U uppercase 

" o go to the other end of the selection

" Visually selecting lines and executing normal @{register} will execute a macro in parallel on the selected lines



"=============== Normal mode ==============="

" s command deletes the current char and puts you in insert mode which is repeatable with the dot command

" ; command repeats the last search with f

" , command repeats the last search with f in reverse

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

" <C-o> move backward in the jump list

" <C-i> move forward in the jump list

" Command                                         Effect
" =================================================================================
" [count]G                                 | Jump to line number
" ---------------------------------------------------------------------------------
" //pattern <CR> / ?pattern <CR> / n / N   | Jump to next/previous 
"                                          | occurrence of pattern
" ---------------------------------------------------------------------------------
" %                                        | Jump to matching parenthesis
" ---------------------------------------------------------------------------------
" ( / )                                    | Jump to start of previous or
"                                          | next sentence
" ---------------------------------------------------------------------------------
" { / }                                    | Jump to start of previous or  
"                                          | next paragraph
" ---------------------------------------------------------------------------------
" H / M / L                                | Jump to top/middle/bottom of  
"                                          | screen
" ---------------------------------------------------------------------------------
" gf                                       | Jump to file name under the 
"                                          | cursor
" ---------------------------------------------------------------------------------
" <C-]>                                    | Jump to definition of keyword
"                                          | under the cursor
" ---------------------------------------------------------------------------------
" ’{mark} / `{mark}                        | Jump to a mark 
" ---------------------------------------------------------------------------------

" g; go backward in change list

" g, go forward in change list

" gi go back to the last insertion and switch back to insert mode

" gf open the file under the cursor

" "_ the blackhole register

" Command                             Effect
" =================================================================================
" %                                 | Name of the current file
" ---------------------------------------------------------------------------------
" #                                 | Name of the alternate file
" ---------------------------------------------------------------------------------
" .                                 | Last inserted text
" ---------------------------------------------------------------------------------
" :                                 | Last Ex command
" ---------------------------------------------------------------------------------
" /                                 | Last search pattern
" ---------------------------------------------------------------------------------

" Playback the last invoked marco @@

" :cl[ose] or <C-w>c close the active window

" :On[ly] or <C-w>o keep only the active window

" Command                             Effect
" =================================================================================
" <C-w> =                           | Equalize width and height of all windows
" ---------------------------------------------------------------------------------
" <C-w> -                           | Maximize height of the active window
" ---------------------------------------------------------------------------------
" <C-w> |                           | Maximize width of the active window
" ---------------------------------------------------------------------------------
" [N]<C-w> _                        | Set active window height to [N] rows
" ---------------------------------------------------------------------------------
" [N]<C-w> |                        | Set active window height to [N] columns
" ---------------------------------------------------------------------------------

" The :lcd {path} command lets us set the working directory locally for the current window. If we create a new tab page and then use the :lcd command to switch to another directory, we can then comfortably scope each tab page to a different project. Note that :lcd applies locally to the current window, not to the current tab page. If we have a tab page containing two or more split windows, we could set the local working directory for all of them by running :windo lcd {path}.

" <C-w>T Move the current window into it's own tab (Only works it here is more than 1 window)

" Command                             Effect
" =================================================================================
" :tabn[ext] {N} {N}gt              | Switch to tab page number {N}
" ---------------------------------------------------------------------------------
" :tabn[ext] gt                     | Switch to the next tab
" ---------------------------------------------------------------------------------
" :tabp[revious] gT                 | Switch to the previous tab page
" ---------------------------------------------------------------------------------

" <C-g? echoes the name and status of the current file

" To change two vertically split windows to horizonally split
" Ctrl-w t Ctrl-w K

" Horizontally to vertically:
" Ctrl-w t Ctrl-w H

" <C-G> see where you are in the file

" ge Backward to end of the previous word

" is Current sentence

" as Current sentence plus one space

" ip Current paragraph

" ap Current paragraph plus one blank line

" (Vim's automatic marks) 
" Command                       Effect
" =================================================================================
" ``                        |   Position before the last jump within current file
" ---------------------------------------------------------------------------------
" `.                        |   Location of last change
" ---------------------------------------------------------------------------------
" `^                        |   Location of last insertion
" ---------------------------------------------------------------------------------
" `[                        |   Start of last change or yank
" ---------------------------------------------------------------------------------
" `]                        |   End of last change or yank
" ---------------------------------------------------------------------------------
" `<                        |   Start of last visual selection
" ---------------------------------------------------------------------------------
" `>                        |   End of last visual selection
" ---------------------------------------------------------------------------------

" {count}@{register}

" q{capitalLetter} will append to a macro

" //e can be used as a motion to select a search from start to end. We could uppercase all characters in a search by using gU//e<cr> 

" We can repeat the command across the entire file just by pressing g& (see :h g& ), which is equivalent to running the following: :%s//~/&

" Pressing <C-]> makes our cursor jump from the keyword under the cursor to the definition.

" Command                       Effect
" =================================================================================
" <C-]>                       | Jump to the first tag that matches the word under "                             | the cursor
" ---------------------------------------------------------------------------------
" g<C-]>                      | Prompt user to select from multiple matches for the "                             | word under the cursor. If only one match exists, 
"                             | jump to it without prompting.
" ---------------------------------------------------------------------------------
" :tag {keyword}              | Jump to the first tag that matches {keyword}
" ---------------------------------------------------------------------------------
" :tjump {keyword}            | Prompt user to select from multiple matches for   "                             | {keyword}. If only one match exists, jump to it 
"                             | without prompting.
" ---------------------------------------------------------------------------------
" :pop or <C-t>               | Reverse through tag history
" ---------------------------------------------------------------------------------
" :tag                        | Advance through tag history
" ---------------------------------------------------------------------------------
" :tnext                      | Jump to next matching tag
" ---------------------------------------------------------------------------------
" :tprev                      | Jump to previous matching tag
" ---------------------------------------------------------------------------------
" :tfirst                     | Jump to first matching tag
" ---------------------------------------------------------------------------------
" :tlast                      | Jump to last matching tag
" ---------------------------------------------------------------------------------
" :tselect                    | Prompt user to choose an item from the tag match list
" ---------------------------------------------------------------------------------

" We can jump backward and forward between flagged words with the [s and ]s commands, respectively (see :h ]s ). With our cursor positioned on a misspelled word, we can ask Vim for a list of suggested corrections by invoking the z= command (see :h z= )

" (Vim's spell checker) 
" Command                       Effect
" =================================================================================
" ]s                          | Jump to next spelling error
" [s                          | Jump to previous spelling error
" z=                          | Suggest corrections for current word
" zg                          | Add current word to spell file
" zw                          | Remove current word from spell file
" zug                         | Revert zg or zw command for current word
" ---------------------------------------------------------------------------------




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
" =================================================================================
" :shell                |  Start a shell (return to Vim by typing exit)
" ---------------------------------------------------------------------------------
" :!{cmd}               |  Execute {cmd} with the shell
" ---------------------------------------------------------------------------------
" :read !{cmd}          |  Execute {cmd} in the shell and insert its standard output 
"                       |  below the cursor
" ---------------------------------------------------------------------------------
" :[range]write !{cmd}  |  Execute {cmd} in the shell with [range] lines as standard
"                       |  input
" ---------------------------------------------------------------------------------
" :[range]!{filter}     |  Filter the specified [range] through external 
"                       |  program {filter}
" ---------------------------------------------------------------------------------

" See the change list with :changes

" See the regiters with :register or shorthand :reg

" :normal to execute a normal mode in Ex mode

" :tabo[nly] Keep only the current tab

" Rearranging Tabs : We can use the :tabmove [N] Ex command to rearrange tab pages. When [N] is 0, the current tab page is moved to the beginning, and if we omit [N], the current tab page is moved to the end.

" :pwd also has a vim implementation to print the working directory.

" :edit %<Tab> => % is a shorthand for the filepath of the active buffer

" :edit %:h<Tab> => The :h modifier removes the filename while preserving the rest of the path

" :%s///gn report the number of matched. (Will not substitute, looks a bit hacky..)

" :%s//\=@0/g replace the search with the contents of the yank register

" We can always specify a new range and replay the substitution using the :&& command. It doesn’t matter what range was used the last time. :&& by itself acts on the current line, :'<,'>&& acts on the visual selection, and :%&& acts on the entire file. As we saw already, the g& command is a handy shortcut for :%&& .

" On Vim’s command line, | simply stands for a command separator, making it equivalent to the semicolon in the Unix shell. 

" :g/{pattern}/[cmd] 

" :g/{pattern}/[range][cmd] Ex commands accept a range so the global could have this signature

" :v/href/d => vglobal delete every line that doesn't contain an href

" :g/search/d delete every line containing the match

" :g/search prints all the searches (print is the default command)

" :g/search/yank A appends all matches to the a register => Capital A means append to register.

" :g/search/t$ copy all mataches to the bottom of the file

" :g/{/ .+1,/}/-1 > indents all blocks

" (Browse the quickfix list) 
" Command                       Effect
" =================================================================================
" :cnext                    |   Jump to next item
" :cprev                    |   Jump to previous item
" :cfirst                   |   Jump to first item
" :clast                    |   Jump to last item
" :cnfile                   |   Jump to first item in next file
" :cpfile                   |   Jump to last item in previous file
" :cc N                     |   Jump to nth item
" :copen                    |   Open the quickfix window
" :cclose                   |   Close the quickfix window
" ---------------------------------------------------------------------------------

" :cd - switches to the previous working directory 

" :set spell turn on spell checking

" :set spelllang=en_us set spell checker language

" How jargon was sourced for practical_vim
" setlocal spelllang=en_us
" setlocal spellfile=~/.vim/spell/en.utf-8.add
" setlocal spellfile+=~/books/practical_vim/jargon.utf-8.add

"=============== Plugins ==============="
" Surround.vim
" Surround the selection with double quotes.
" S"





"=============== Other tips ==============="
" \zs to specify the start of a subset in a search

" \ze to specify the end of a subset in a search

" \x stands for a character class or [0-9A-Fa-f]

" \V very no magic search

" \v very magic search 

" <{word_boundaries}> in search

" % will ignore the captured parenthesis in search, so in regex you can't refer back to them, because they will be ignored :)

" (Symbol Represents) 
" Command                       Effect
" =================================================================================
" \r                        |   Insert a carriage return
" ---------------------------------------------------------------------------------
" \t                        |   Insert a tab character
" ---------------------------------------------------------------------------------
" \\                        |   Insert a single backslash
" ---------------------------------------------------------------------------------
" \1                        |   Insert the first submatch
" ---------------------------------------------------------------------------------
" \2                        |   Insert the second submatch (and so on, up to \9)
" ---------------------------------------------------------------------------------
" \0                        |   Insert the entire matched pattern
" ---------------------------------------------------------------------------------
" &                         |   Insert the entire matched pattern
" ---------------------------------------------------------------------------------
" ~                         |   Use {string} from the previous invocation of :"                           |   substitute
" ---------------------------------------------------------------------------------
" \=                        |   {Vim script} Evaluate {Vim script} expression; use   "                           |   result as replacement {string}
" ---------------------------------------------------------------------------------

" The c flag causes Vim to show us each match and ask “Replace with copy?”
" The following commands are available when we are in the replace mode:

" Trigger                       Effect
" =================================================================================
" y                         |   Substitute this match
" ---------------------------------------------------------------------------------
" n                         |   Skip this match
" ---------------------------------------------------------------------------------
" q                         |   Quit substituting
" ---------------------------------------------------------------------------------
" l                         |   “last”—Substitute this match, then quit
" ---------------------------------------------------------------------------------
" a                         |   “all”—Substitute this and any remaining matches
" ---------------------------------------------------------------------------------
" <C-e>                     |   Scroll the screen up
" ---------------------------------------------------------------------------------
" <C-y>                     |   Scroll the screen down
" ---------------------------------------------------------------------------------

" Configure the ‘path’
" The ‘path’ option allows us to specify a set of directories inside of which Vim
" will search when the :find command is invoked (see :h 'path' ). In our case, we
" want to make it easier to look up files in the app/controllers and app/views directo-
" ries. We can add these to our path simply by running this:
" ➾ :set path+=app/**
" The ** wildcard matches all subdirectories beneath the app/ directory. We
" discussed wildcards in Populate the Argument List, on page 81, but the
" treatment of * and ** is slightly different in the context of the ‘path’ setting (see
" :h file-searching ). The wildcards are handled by Vim rather than by the shell.

" Vim has a vast number of motions. We can’t cover them all in this chapter,
" so I recommend that you look up the :h motion.txt section of Vim’s documen-
" tation for a complete reference.
