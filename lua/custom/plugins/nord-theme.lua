return {
  {
    'nordtheme/vim',
    lazy = false,
    config = function()
      vim.opt.termguicolors = true

      vim.cmd 'colorscheme nord'

      local nord_colors = {
        nord0 = '#2E3440', -- Polar Night 0: darkest background
        nord1 = '#3B4252', -- Polar Night 1: slightly lighter background
        nord2 = '#434C5E', -- Polar Night 2: used for floating windows, selection
        nord3 = '#4C566A', -- Polar Night 3: bright background/secondary text
        nord4 = '#D8DEE9', -- Snow Storm 0: light foreground
        nord5 = '#E5E9F0', -- Snow Storm 1: lighter foreground
        nord6 = '#ECEFF4', -- Snow Storm 2: brightest foreground / white
        nord7 = '#8FBCBB', -- Frost 0: cyan (variables, some UI elements)
        nord8 = '#88C0D0', -- Frost 1: lighter cyan / JSX tags
        nord9 = '#81A1C1', -- Frost 2: blue (types, attributes)
        nord10 = '#5E81AC', -- Frost 3: alternative blue
        nord11 = '#A3BE8C', -- Aurora 0: green (success, positive values)
        nord12 = '#EBCB8B', -- Aurora 1: yellow (warnings)
        nord13 = '#BF616A', -- Aurora 2: red (errors)
        nord14 = '#B48EAD', -- Aurora 3: magenta/purple (functions, highlights)
      }

      vim.api.nvim_set_hl(0, 'NormalFloat', {
        bg = nord_colors.nord1,
        fg = nord_colors.nord4,
      })

      -- Color JSX tag delimiters like < and />
      vim.api.nvim_set_hl(0, '@tag.delimiter.tsx', { fg = nord_colors.nord10 }) -- blue-ish
      vim.api.nvim_set_hl(0, '@tag.delimiter', { fg = nord_colors.nord10 }) -- fallback for HTML/JSX
      vim.api.nvim_set_hl(0, '@punctuation.bracket.tsx', { fg = nord_colors.nord7 }) -- angle brackets sometimes fall here
      vim.api.nvim_set_hl(0, '@operator.tsx', { fg = nord_colors.nord9 }) -- optional: color '=' and '>' differently

      vim.api.nvim_set_hl(0, '@tag.builtin.tsx', { fg = nord_colors.nord4 })
      vim.api.nvim_set_hl(0, '@tag.tsx', { fg = nord_colors.nord8 }) -- user-defined components
      vim.api.nvim_set_hl(0, '@tag.builtin.tsx', { fg = nord_colors.nord9 })
      vim.api.nvim_set_hl(0, '@keyword.import', { fg = nord_colors.nord4 })
      vim.api.nvim_set_hl(0, '@keyword.export', { fg = nord_colors.nord4 })
      vim.api.nvim_set_hl(0, '@keyword.return', { fg = nord_colors.nord14 })
      vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = nord_colors.nord12 })
      vim.api.nvim_set_hl(0, '@type.builtin', { fg = nord_colors.nord9 }) -- primitive types: string, number, boolean

      -- 🔹 Custom highlight group for invariant()
      vim.api.nvim_set_hl(0, 'InvariantKeyword', { fg = nord_colors.nord14 })

      -- Highlight 'invariant' in TypeScript / TSX buffers
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'typescript', 'typescriptreact' },
        callback = function()
          vim.fn.matchadd('InvariantKeyword', '\\<invariant\\>')
        end,
      })
    end,
  },
}
