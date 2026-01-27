return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'nord',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            {
              'branch',
              icon = '',
              -- 1. This condition hides the branch if more than 1 window exists
              cond = function()
                return #vim.api.nvim_tabpage_list_wins(0) == 1
              end,
              -- 2. Simplified fmt: We don't need to check for splits here anymore
              fmt = function(str)
                -- Just clean up the name (e.g. remove "origin/")
                return str:match '[^/]+$' or str
              end,
            },
            {
              'diagnostics',
              diagnostics_color = {
                error = { fg = '#BF616A' },
                warn = { fg = '#EBCB8B' },
                info = { fg = '#88C0D0' },
                hint = { fg = '#EBCB8B' },
              },
            },
            'diff',
          },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {
            {
              'filename',
              path = 1,
              fmt = function(name)
                return name:gsub('%.%w+$', '') -- remove file extension
              end,
            },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {
            {
              'filename',
              path = 0,
              fmt = function(name)
                return name:gsub('%.%w+$', '')
              end,
            },
          },
        },
      }
    end,
  },
}
