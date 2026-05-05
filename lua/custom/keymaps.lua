-- a/custom/keymaps.lua
-- Centralized keymaps for Neovim
local keymap = vim.keymap

-- -------------------------
-- General keymaps
-- -------------------------

-- Clear highlights on search
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Generic copen toggle (Works for BOTH Telescope and Diagnostics)
keymap.set('n', '<leader>cc', function()
  local qf_open = false
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      qf_open = true
      break
    end
  end
  if qf_open then
    vim.cmd.cclose()
  else
    vim.cmd.copen()
  end
end, { desc = 'Toggle [C]ommand [C]enter (Quickfix)' })

-- Save only if modified
keymap.set('n', '<leader>w', function()
  if vim.bo.modified then
    vim.cmd.write()
    print '💾 File saved'
  else
    print 'No changes to save'
  end
end, { desc = 'Save file if modified' })

-- Quit safely
keymap.set('n', '<leader>q', function()
  local ok = pcall(function()
    vim.cmd.quit()
  end)
  if not ok then
    print 'Nothing to quit'
  end
end, { desc = 'Quit window safely' })

-- Exit terminal mode
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Split windows
keymap.set('n', '<C-w>h', ':split<CR>', { desc = 'Split window horizontally' })
keymap.set('n', '<C-w>v', ':vsplit<CR>', { desc = 'Split window vertically' })

-- Faster window resizing
keymap.set('n', '<C-w>>', '25<C-w>>', { noremap = true, silent = true })
keymap.set('n', '<C-w><', '25<C-w><', { noremap = true, silent = true })
keymap.set('n', '<C-w>+', '25<C-w>+', { noremap = true, silent = true })
keymap.set('n', '<C-w>-', '25<C-w>-', { noremap = true, silent = true })

