return {
  {
    'github/copilot.vim',
    event = 'InsertEnter', -- Lazy-load on entering insert mode
    config = function()
      -- Optional: Enable Copilot for specific filetypes
      -- By default it's enabled for many, but you can customize it.
      -- Use '*' to enable for all filetypes.
      vim.g.copilot_filetypes = {
        ['*'] = true,
        -- markdown = true,
        -- help = false,
        -- gitcommit = false,
      }
    end,
  },
}
