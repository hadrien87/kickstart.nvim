return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'doom',
        config = {
          center = { -- Buttons / Quick Actions
            { icon = '  ', desc = 'Find File', action = 'Telescope find_files', key = 'f' },
            { icon = '  ', desc = 'Find Neovim Files', action = 'Telescope find_files cwd=~/.config/nvim', key = 'n' },
            { icon = '  ', desc = 'Recent Files', action = 'Telescope oldfiles', key = 'r' },
            { icon = '  ', desc = 'Bookmarks', action = 'Telescope marks', key = 'm' },
            { icon = '  ', desc = 'Update Plugins', action = 'Lazy sync', key = 'u' },
            { icon = '  ', desc = 'Quit', action = 'qa', key = 'q' },
          },
          footer = { '🚀 Kickstart your coding session!' }, -- Optional Footer
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}
