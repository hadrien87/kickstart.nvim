return {
  {
    'stevearc/oil.nvim',
    opts = {
      keymaps = {
        ['<C-n>'] = 'j',
        ['<C-p>'] = 'k',
        ['<C-y>'] = 'actions.select',
        ['<C-v>'] = 'actions.select_vsplit',
        ['<C-h>'] = 'actions.select_split',
      },
      columns = { 'icon' },
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 0,
        max_width = 40,
        max_height = 30,
        border = 'rounded',
        get_win_title = function(winid)
          local buf = vim.api.nvim_win_get_buf(winid)
          local dir = require('oil').get_current_dir(buf)

          if not dir then
            return ''
          end

          local git_root = vim.fs.find('.git', { path = dir, upward = true })[1]

          if git_root then
            local root_dir = vim.fn.fnamemodify(git_root, ':h')

            if dir == root_dir .. '/' then
              return '/'
            end

            return dir:sub(#root_dir + 2)
          end

          return vim.fn.fnamemodify(dir, ':~')
        end,
        override = function(conf)
          conf.anchor = 'NW'
          conf.row = 1
          conf.col = vim.o.columns - conf.width - 2
          return conf
        end,
      },
    },
    keys = {
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
