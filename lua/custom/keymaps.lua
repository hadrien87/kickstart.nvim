-- lua/custom/keymaps.lua
-- Centralized keymaps for Neovim

local keymap = vim.keymap

-- Clear highlights on search
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Navigate vim panes easier
keymap.set('n', '<c-k>', ':wincmd k<CR>')
keymap.set('n', '<c-j>', ':wincmd j<CR>')
keymap.set('n', '<c-h>', ':wincmd h<CR>')
keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Diagnostic keymaps
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation (CTRL + hjkl)
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Splitting windows
keymap.set('n', '<C-w>h', ':split<CR>', { desc = 'Split window horizontally' })
keymap.set('n', '<C-w>v', ':vsplit<CR>', { desc = 'Split window vertically' })

-- Resize splits with Alt + h/j/k/l
keymap.set('n', '<M-h>', '<C-w><', { noremap = true, silent = true, desc = 'Resize split left' })
keymap.set('n', '<M-l>', '<C-w>>', { noremap = true, silent = true, desc = 'Resize split right' })
keymap.set('n', '<M-k>', '<C-w>+', { noremap = true, silent = true, desc = 'Resize split up' })
keymap.set('n', '<M-j>', '<C-w>-', { noremap = true, silent = true, desc = 'Resize split down' })
