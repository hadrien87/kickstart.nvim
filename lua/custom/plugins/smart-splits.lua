return {
  {
    'mrjones2014/smart-splits.nvim',
    lazy = false,
    opts = {
      multiplexer_integration = vim.env.TMUX and 'tmux' or 'wezterm',
    },
    keys = {
      {
        '<C-h>',
        function()
          require('smart-splits').move_cursor_left()
        end,
        desc = 'Navigate left',
      },
      {
        '<C-j>',
        function()
          require('smart-splits').move_cursor_down()
        end,
        desc = 'Navigate down',
      },
      {
        '<C-k>',
        function()
          require('smart-splits').move_cursor_up()
        end,
        desc = 'Navigate up',
      },
      {
        '<C-l>',
        function()
          require('smart-splits').move_cursor_right()
        end,
        desc = 'Navigate right',
      },
      {
        '<M-h>',
        function()
          require('smart-splits').resize_left()
        end,
        desc = 'Shrink pane horizontally',
      },
      {
        '<M-j>',
        function()
          require('smart-splits').resize_down()
        end,
        desc = 'Shrink pane vertically',
      },
      {
        '<M-k>',
        function()
          require('smart-splits').resize_up()
        end,
        desc = 'Grow pane vertically',
      },
      {
        '<M-l>',
        function()
          require('smart-splits').resize_right()
        end,
        desc = 'Grow pane horizontally',
      },
    },
  },
}
