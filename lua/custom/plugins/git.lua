return {
  {
    'tpope/vim-fugitive',
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.nav_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to next/prev hunk' })

        -- Actions
        map('n', '<leader>hh', gs.toggle_linehl, { desc = 'Git [H]ighlight [H]ighlight' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'Git [H]ighlight [D]iff' })
        map('n', '<leader>hb', function()
          gs.blame { full = true }
        end, { desc = 'Git [H]ighlight [B]lame' })
      end,
    },
  },
}
