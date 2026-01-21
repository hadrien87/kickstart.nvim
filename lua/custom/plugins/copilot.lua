return {
  {
    'zbirenbaum/copilot.lua',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = true, auto_trigger = true }, -- auto_trigger is recommended
        panel = { enabled = false },
        filetypes = { ['*'] = true },
      }
    end,
  },
}
