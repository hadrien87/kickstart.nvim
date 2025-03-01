return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'dracula',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' }, -- active: branch left
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'filename' }, -- active: filename right
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {}, -- inactive: no branch
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'filename' }, -- inactive: only filename right
        },
      }
    end,
  },
}
