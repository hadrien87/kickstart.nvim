-- lua/custom/options.lua
-- Neovim options

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Mouse mode (optional, can enable if you like resizing splits with the mouse)
-- opt.mouse = 'a'

-- Don't show mode in command line (statusline usually shows it)
opt.showmode = false

-- Clipboard sync with system (schedule for faster startup)
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

-- Break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Searching
opt.ignorecase = true
opt.smartcase = true

-- Sign column always on
opt.signcolumn = 'yes'

-- Update times for faster completion
opt.updatetime = 250
opt.timeoutlen = 300

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Show certain whitespace characters
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live as you type
opt.inccommand = 'split'

-- Highlight current line
opt.cursorline = true

-- Minimal number of screen lines above/below cursor
opt.scrolloff = 10
