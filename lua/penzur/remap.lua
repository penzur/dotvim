vim.keymap.set("n", "<leader>n", vim.cmd.Ex)
vim.keymap.set("n", ";", ":")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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
vim.keymap.set("n", "<C-j>", "2gj^zz")
vim.keymap.set("n", "<C-k>", "2gk^zz")

vim.keymap.set("n", "<leader>w", "<cmd>HopWordMW<CR>", { noremap = true })
vim.keymap.set("n", "<leader>so", ":so $MYVIMRC<CR>", { noremap = true })

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
