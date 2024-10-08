-- vim.shortmess = "I"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.list = true
vim.opt.listchars = "tab:   ,trail:.,eol:¬,nbsp:_"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.shortmess:append("I")
vim.opt.cursorline = true
-- g
vim.g.mapleader = " "
-- vim.g.netrw_liststyle = 3
-- mouse
vim.opt.mouse = "a"
