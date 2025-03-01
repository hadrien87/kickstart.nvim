-- lua/custom/globals.lua
-- Global variables and leader keys

-- Set <space> as the leader key
-- NOTE: Must happen before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Disable netrw to allow custom file explorers
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
