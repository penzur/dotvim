vim.keymap.set("n", "<leader>n", vim.cmd.Ex)
vim.keymap.set("n", ";", ":")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- bubbles
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-j>", ":m +1<CR>")
vim.keymap.set("n", "<C-k>", ":m -2<CR>")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("n", "{", "{kzz")
-- vim.keymap.set("n", "}", "}jzz")
vim.keymap.set("n", "<up>", "2{kzz")
vim.keymap.set("n", "<down>", "2}jzz")
vim.keymap.set("n", "<C-u>", "k{<Space>0")
vim.keymap.set("n", "<C-d>", "j}<BS>0")
vim.keymap.set("n", "<A-k>", "2-")
vim.keymap.set("n", "<A-j>", "2<cr>")
vim.keymap.set("n", "<C-e>", "2<C-e>", { noremap = true })
vim.keymap.set("n", "<C-y>", "2<C-y>", { noremap = true })

vim.keymap.set("n", "<leader>hw", "<cmd>HopWordMW<CR>", { noremap = true })

vim.keymap.set("n", "<leader><tab>", "za")
vim.keymap.set("n", "<leader><s-tab>", "zR")

-- select all
vim.keymap.set("n", "<leader>a", "ggVG")

-- save that shit!
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- Key mapping for Go
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
      vim.keymap.set("n", "<C-x>", ":!go run %<CR>", { buffer = true })
  end,
})

-- Key mapping for Rust
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
      vim.keymap.set("n", "<C-x>", ":!cargo run<CR>", { buffer = true })
  end,
})

-- Key mapping for git fugitive
vim.api.nvim_create_autocmd("FileType", {
  pattern = "fugitive",
  callback = function()
      vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { buffer = true })
      vim.keymap.set("n", "<escape>", ":bd<CR>", { buffer = true })
  end,
})

-- Key mapping for netrw
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
      vim.keymap.set("n", "<escape>", ":bd<CR>", { buffer = true })
  end,
})

-- buffers
vim.keymap.set("n", "<C-h>", ":bp<CR>")
vim.keymap.set("n", "<C-l>", ":bn<CR>")

-- tabs
vim.keymap.set("n", "<A-h>", ":tabprevious<CR>")
vim.keymap.set("n", "<A-l>", ":tabnext<CR>")

-- TS
vim.keymap.set("n", "<leader>ts", ":TSToggle highlight<CR>")
vim.keymap.set("n", "<leader>tm", ":silent !tmux ls | fzf-tmux -h | sed 's/:.*//' | xargs tmux switch -t<CR>")
