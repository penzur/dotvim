[ dotvim ]

my personal vim config



[ requirements ]

- neovim
- git
- nodejs



[ setup ]

1. git clone https://github.com/penzur/dotvim.git ~/.config/nvim

2. and then run

   nvim +PlugInstall +qal

3. launch nvim and run

   :CocInstall coc-go coc-rust-analyzer coc-tsserver coc-snippets coc-ultisnips coc-prettier coc-eslint

4. (optional) you can create a .extra.vim under your home directory and
   add your own custom vim settings there, it will be sourced automatically

DONE!
