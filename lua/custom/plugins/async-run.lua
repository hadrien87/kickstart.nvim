return {
  {
    'skywind3000/asyncrun.vim',
    config = function()
      -- Load the TypeScript compiler settings for quickfix parsing
      vim.cmd [[
        autocmd FileType typescript,typescriptreact compiler tsc
      ]]

      -- Key mapping to run typecheck in project web folder
      vim.api.nvim_set_keymap(
        'n',
        '<leader>tc',
        ':compiler tsc<Bar>AsyncRun -mode=quickfix cd /Users/hadrien.rudich/1.Projects/revault/packages/web && pnpm run typecheck<CR>',
        { noremap = true, silent = true }
      )

      -- Automatically open quickfix if there are errors
      vim.cmd [[
        autocmd User AsyncRunPost if len(getqflist()) > 0 | copen | endif
      ]]
    end,
  },
}
