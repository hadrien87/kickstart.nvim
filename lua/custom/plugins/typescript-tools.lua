return {
  {
    'pmizio/typescript-tools.nvim',
    ft = { 'typescript', 'typescriptreact', 'typescript.tsx' }, -- filetypes to load the plugin on
    dependencies = { 'nvim-lua/plenary.nvim' }, -- typescript-tools.nvim dependency
    config = function()
      require('typescript-tools').setup {} -- setup the plugin
    end,
  },
}
