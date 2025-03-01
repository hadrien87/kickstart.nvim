-- lua/custom/autocmds.lua
-- Centralized autocommands for Neovim

local api = vim.api

-- Highlight yanked text
api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Restore last cursor position when opening a file
api.nvim_create_autocmd('BufReadPost', {
  desc = 'Return to last edit position when opening a file',
  callback = function()
    local mark = vim.fn.line [["]]
    if mark > 1 and mark <= vim.fn.line '$' then
      vim.cmd [[normal! g`"]]
    end
  end,
})
