return {
  {
    'stevearc/oil.nvim',
    opts = {
      columns = { 'icon' }, -- Show icons only
      view_options = {
        show_hidden = true, -- Show dotfiles
      },
      float = {
        padding = 2,
        max_width = 40,
        max_height = 30,
        border = 'rounded',
        override = function(conf)
          -- Position in the upper right corner
          conf.anchor = 'NW'
          conf.row = 1 -- Near the top
          conf.col = vim.o.columns - conf.width - 2 -- Align to the right
          return conf
        end,
      },
    },
    keys = {
      -- Open Oil floating window in the buffer's directory
      {
        '<leader>e',
        function()
          require('oil').open_float(vim.fn.expand '%:p:h')
        end,
        desc = "Open Oil file explorer in floating window (buffer's directory)",
      },
    },
  },
}
