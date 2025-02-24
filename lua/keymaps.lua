-- See `:help vim.keymap.set()`

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Keep the cursor in the middle when scrolling with <C-d> and <C-u>
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', '<C-u>', "<C-u>zz")

-- Keep the cursor in the middle when going through the search results
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paste and keep the value in our register
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste and keep the previous value in the register' })

-- Yank to the system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to the system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y', { desc = 'Yank to the end of the line to the system clipboard' })

-- Delete to the void register
-- vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete to the void register' })

-- Easily move between windows
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move cursor to the window below current one.' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move cursor to the window above current one.' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move cursor to the window left of current one.' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move cursor to the window right of current one.' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

local function yank_path_and_line_number()
    -- path:line_number
    local yank_text = vim.fn.expand('%:p') .. ':' .. vim.fn.line('.')
    vim.fn.setreg('', yank_text)
end

vim.keymap.set('n', 'yp', yank_path_and_line_number, { desc = 'Yank path and line number to the default register.' })

-- Open netrw
vim.keymap.set('n', '<leader>x', ":Ex<CR>")

-- Right split
vim.keymap.set('n', '<leader>v', ":vs<CR>")
