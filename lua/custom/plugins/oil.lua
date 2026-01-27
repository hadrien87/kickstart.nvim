return {
  {
    'stevearc/oil.nvim',
    opts = {
      columns = { 'icon' },
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 0,
        max_width = 40,
        max_height = 30,
        border = 'rounded',
        get_win_title = function(winid)
          local buf = vim.api.nvim_win_get_buf(winid)
          -- 2. Retrieve the directory properly from the Oil buffer
          local dir = require('oil').get_current_dir(buf)

          -- Fallback if dir is nil (shouldn't happen in Oil)
          if not dir then
            return ''
          end

          -- 3. Find the git root
          local git_root = vim.fs.find('.git', { path = dir, upward = true })[1]

          if git_root then
            -- .git is a folder, so the root is its parent
            local root_dir = vim.fn.fnamemodify(git_root, ':h')

            if dir == root_dir then
              return vim.fn.fnamemodify(dir, ':t')
            end

            -- Slice the string to remove the root + leading slash
            -- (+2 accounts for the length of the root string + the slash character)
            return dir:sub(#root_dir + 2)
          end

          -- Fallback for non-git folders
          return vim.fn.fnamemodify(dir, ':~')
        end,
        override = function(conf)
          conf.anchor = 'NW'
          conf.row = 1
          conf.col = vim.o.columns - conf.width - 2
          return conf
        end,
      },
    },
    keys = {
      {
        '<leader>e',
        function()
          require('oil').open_float(vim.fn.expand '%:p:h')
        end,
        desc = "Open Oil file explorer in floating window (buffer's directory)",
      },
    },
  },
}
