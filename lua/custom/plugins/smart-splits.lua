return {
  {
    'mrjones2014/smart-splits.nvim',
    config = function()
      require('smart-splits').setup {
        default_amount = 5, -- default resize increment
        resize_mode = {
          quit_key = '<ESC>', -- how to exit resize mode
          resize_keys = { 'h', 'j', 'k', 'l' }, -- which keys to use
          hooks = {
            on_enter = function()
              vim.notify('Resize mode ON', vim.log.levels.INFO)
            end,
            on_leave = function()
              vim.notify('Resize mode OFF', vim.log.levels.INFO)
            end,
          },
        },
      }
    end,
  },
}
