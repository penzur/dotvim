return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local rf = require 'refactoring'
    rf.setup {}
    vim.keymap.set({ 'n', 'x' }, '<leader>r', function()
      rf.select_refactor {}
    end)
  end,
}
