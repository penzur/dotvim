" Plugins
call plug#begin('~/.config/nvim/bundle')

" colors
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'chriskempson/base16-vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'projekt0n/github-nvim-theme'

Plug 'mg979/vim-visual-multi'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ddollar/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'tpope/vim-unimpaired'
Plug 'phaazon/hop.nvim'
Plug 'tpope/vim-fugitive'
Plug 'markstory/vim-zoomwin'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'https://github.com/github/copilot.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/utl.vim'
Plug 'BurntSushi/ripgrep'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" extra plugs
if filereadable(expand("~/.plugins.vim"))
		source ~/.plugins.vim
endif

call plug#end()
