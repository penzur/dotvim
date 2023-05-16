" load plugins
source ~/.config/nvim/plugins.vim
" Change mapleader
let mapleader=","
let maplocalleader="\<space>"
set termguicolors
set termbidi
set mouse=a
" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Don’t add empty newlines at the end of files
set nobinary
set noeol
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set viminfo=
set nobackup
set nowb
set noswapfile
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <C-s> :w<CR>
" Use tabs rather than spaces
set noexpandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 2 spaces
set shiftwidth=4
set tabstop=4
" Linebreak on 500 characters
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set nowrap "Wrap lines
" Respect modeline in files
set modeline
set modelines=4
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Show “invisible” characters
set lcs=tab:\ \ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
" set scrolloff=9
set scroll=3
"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=20        "this is just what i use

nnoremap ; :
nnoremap <silent> <leader>1 :tabnew ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader>2 :so ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader>3 :tabnew ~/.config/nvim/plugins.vim<cr>

" EMMET with tab expander FTW!
autocmd FileType html,htmldjango,css,scss,sass imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
	noremap
endfunction <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
	set t_ut=
endif

autocmd BufWritePre * %s/\s\+$//e

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" source extra config file if exists
if filereadable(expand("~/.extra.vim"))
	source ~/.extra.vim
endif
set colorcolumn=80
set rnu
set nu
hi EndOfBuffer guibg=none
hi NonText guibg=none guifg=#aaaaaa
hi clear SignColumn
hi clear LineNr
hi Keyword gui=italic,bold
hi SpecialKey ctermbg=NONE

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr=

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

" faster scroll
nnoremap <silent> <A-j> 2gj^zz
nnoremap <silent> <A-k> 2gk^zz


" HOP, easy motion goodness!
lua require'hop'.setup()
nnoremap <A-,> :HopWord<CR>
nnoremap <A-w> :HopWordAC<CR>
nnoremap <A-q> :HopWordBC<CR>

if has("statusline") && !&cp
	set laststatus=2  " always show the status bar

	" Start the status line
	set statusline=%f\ %m\ %r
	set statusline+=Line:%l/%L[%p%%]
	set statusline+=Col:%v
	set statusline+=Buf:#%n
	set statusline+=[%b][0x%B]
endif

" nerdtree mappings
nnoremap <leader>n :NERDTreeToggle<cr>

set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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
	else
		call CocAction('doHover')
	endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc-go add missing imports on save
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" tab/space lang settings
let g:rust_recommended_style = 0
autocmd Filetype python,php,rust setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype html,ruby,cucumber,javascript,typescript,json,jade,pug,sh,text,jsx,scala,css,scss setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype go setlocal ts=4 sts=4 sw=4 noexpandtab

" telescope mappings
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <C-g> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <C-b> <cmd>lua require('telescope.builtin').buffers({ ignore_current_buffer = true })<cr>
nnoremap <C-h> <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <C-f> <cmd>lua require('telescope.builtin').treesitter({ symbols = {'function', 'method'} })<cr>

lua <<EOF
local actions = require("telescope.actions")
require("telescope").setup({
defaults = {
	layout_config = {
		horizontal = {
			preview_cutoff = 0,
		},
	},
	mappings = {
		i = {
			["<esc>"] = actions.close,
			["<C-j>"] = actions.move_selection_next,
			["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
})
EOF
