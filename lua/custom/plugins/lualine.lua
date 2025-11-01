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
              fmt = function(str)
                -- Check if there’s more than one window open (split)
                local wins = vim.api.nvim_tabpage_list_wins(0)
                local is_split = #wins > 1

                -- Shorten branch prefix (e.g. remove "origin/")
                local name = str:match '[^/]+$' or str

                -- Only truncate if split and name is long
                if is_split and #name > 25 then
                  name = name:sub(1, 22) .. '...'
                end

                return name
              end,
            },
            {
              'diagnostics',
              diagnostics_color = {
                error = { fg = '#BF616A' }, -- nord11 red
                warn = { fg = '#EBCB8B' }, -- nord12 yellow
                info = { fg = '#88C0D0' }, -- nord8 cyan
                hint = { fg = '#EBCB8B' }, -- override hint to nord yellow
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
              path = 0, -- just the filename
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
