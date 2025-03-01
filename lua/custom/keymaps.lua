-- lua/custom/keymaps.lua
-- Centralized keymaps for Neovim
local keymap = vim.keymap

-- -------------------------
-- General keymaps
-- -------------------------
-- Clear highlights on search
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', function()
  local qf_open = false

  -- check if any window is a quickfix
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win['quickfix'] == 1 then
      qf_open = true
      break
    end
  end

  if qf_open then
    vim.cmd 'cclose' -- close if already open
  else
    vim.diagnostic.setqflist() -- always update quickfix list
    vim.cmd 'copen' -- open quickfix
  end
end, { desc = 'Toggle diagnostic [Q]uickfix list' })

-- Exit terminal mode
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Split windows
keymap.set('n', '<C-w>h', ':split<CR>', { desc = 'Split window horizontally' })
keymap.set('n', '<C-w>v', ':vsplit<CR>', { desc = 'Split window vertically' })

-- -------------------------
-- WezTerm Integration
-- -------------------------
if vim.env.WEZTERM_PANE then
  -- Set the IS_NVIM variable for WezTerm
  vim.fn.system 'wezterm cli set-user-var IS_NVIM true'

  -- Clear the variable on exit
  vim.api.nvim_create_autocmd('VimLeave', {
    pattern = '*',
    callback = function()
      vim.fn.system 'wezterm cli set-user-var IS_NVIM false'
    end,
  })

  -- Navigation helper: try Neovim split first, fallback to WezTerm
  local function navigate(wincmd_dir, wezterm_dir)
    local current_win = vim.fn.winnr()
    vim.cmd('wincmd ' .. wincmd_dir)
    if current_win == vim.fn.winnr() then
      vim.fn.system('wezterm cli activate-pane-direction ' .. wezterm_dir)
    end
  end

  -- Navigation keymaps
  keymap.set('n', '<C-h>', function()
    navigate('h', 'Left')
  end, { desc = 'Navigate left' })
  keymap.set('n', '<C-j>', function()
    navigate('j', 'Down')
  end, { desc = 'Navigate down' })
  keymap.set('n', '<C-k>', function()
    navigate('k', 'Up')
  end, { desc = 'Navigate up' })
  keymap.set('n', '<C-l>', function()
    navigate('l', 'Right')
  end, { desc = 'Navigate right' })

  -- -------------------------
  -- Smart-splits & resize integration
  -- -------------------------
  local smart_splits = nil
  local function get_smart_splits()
    if not smart_splits then
      local ok, module = pcall(require, 'smart-splits')
      if ok then
        smart_splits = module
      end
    end
    return smart_splits
  end

  local function resize_split(direction)
    local ss = get_smart_splits()
    local initial_width = vim.fn.winwidth(0)
    local initial_height = vim.fn.winheight(0)

    if ss then
      if direction == 'left' then
        ss.resize_left()
      elseif direction == 'right' then
        ss.resize_right()
      elseif direction == 'up' then
        ss.resize_up()
      elseif direction == 'down' then
        ss.resize_down()
      end
    end

    local new_width = vim.fn.winwidth(0)
    local new_height = vim.fn.winheight(0)

    -- Fallback to WezTerm if window didn't resize
    if initial_width == new_width and initial_height == new_height then
      local wezterm_direction = ({ left = 'Left', right = 'Right', up = 'Up', down = 'Down' })[direction]
      vim.fn.system("wezterm cli emit 'resize-pane' --payload '" .. wezterm_direction .. ",3'")
    end
  end

  -- Resize keymaps
  keymap.set('n', '<M-l>', function()
    resize_split 'right'
  end, { desc = 'Grow pane horizontally' })
  keymap.set('n', '<M-h>', function()
    resize_split 'left'
  end, { desc = 'Shrink pane horizontally' })
  keymap.set('n', '<M-k>', function()
    resize_split 'up'
  end, { desc = 'Grow pane vertically' })
  keymap.set('n', '<M-j>', function()
    resize_split 'down'
  end, { desc = 'Shrink pane vertically' })
end
