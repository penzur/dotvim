local is_zoomed = false

function ToggleZoom()
    if is_zoomed then
        vim.cmd('wincmd =') -- Reset to equal split sizes
        is_zoomed = false
    else
        vim.cmd('wincmd _') -- Maximize height
        vim.cmd('wincmd |') -- Maximize width
        is_zoomed = true
    end
end

-- zoom toggle
vim.api.nvim_set_keymap('n', '<leader>z', ':lua ToggleZoom()<CR>', { noremap = true, silent = true })
