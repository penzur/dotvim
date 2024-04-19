vim.keymap.set("n", "<leader>n", vim.cmd.Ex)
vim.keymap.set("n", ";", ":")

-- bubbles
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-j>", ":m +1<CR>")
vim.keymap.set("n", "<C-k>", ":m -2<CR>")

-- vim.keymap.set("n", "<C-d>", "}^zz")
-- vim.keymap.set("n", "<C-u>", "{^zz")
vim.keymap.set("n", "<C-u>", "{kzz")
vim.keymap.set("n", "<C-d>", "}jzz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("n", "{", "2{kzz")
-- vim.keymap.set("n", "}", "2}jzz")
vim.keymap.set("n", "<up>", "2{kzz")
vim.keymap.set("n", "<down>", "2}jzz")
vim.keymap.set("n", "<left>", ":tabprevious<CR>")
vim.keymap.set("n", "<right>", ":tabnext<CR>")

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

-- buffers
vim.keymap.set("n", "<C-h>", ":bp<CR>")
vim.keymap.set("n", "<C-l>", ":bn<CR>")

-- TS
vim.keymap.set("n", "<leader>ts", ":TSToggle highlight<CR>")
