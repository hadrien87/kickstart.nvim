return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      --       -- Simple and easy statusline.
      --       --  You could remove this setup call if you don't like it,
      --       --  and try some other statusline plugin
      -- local statusline = require 'mini.statusline'
      --
      -- statusline.setup {
      --   use_icons = vim.g.have_nerd_font,
      -- }
      --
      -- -- Show mode, filename, git branch, and line number
      -- statusline.section_active = function()
      --   local mode = statusline.section_mode()
      --   local filename = statusline.section_filename()
      --   local git_branch = statusline.section_git() -- Git branch
      --   local location = '%2l' -- Line number only
      --
      --   return table.concat({ mode, filename, git_branch, location }, ' | ')
      -- end
      --
      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
