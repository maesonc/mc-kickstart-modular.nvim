-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '=h', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local toggle = false

vim.api.nvim_set_keymap('n', '<leader>z', '', {
  noremap = true,
  silent = true,
  callback = function()
    if toggle then
      vim.cmd 'wincmd =' -- Equalize window sizes
    else
      vim.cmd 'wincmd |' -- Maximize the current window horizontally
    end
    toggle = not toggle -- Flip the toggle state
  end,
})
-- vim.api.nvim_set_keymap('n', '<leader>z', '<C-w>=', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>Z', '<C-w>|', { noremap = true, silent = true })

local function toggle_diffthis()
  local bufname = vim.api.nvim_buf_get_name(0)
  local diff_enabled = false

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == '' then
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.api.nvim_buf_get_option(buf, 'diff') then
        diff_enabled = true
        break
      end
    end
  end

  if diff_enabled then
    vim.cmd 'windo diffoff'
  else
    vim.cmd 'windo diffthis'
  end
end

vim.api.nvim_set_keymap('n', '<leader>di', ':windo diffthis <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dc', ':windo diffoff <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dg', '<cmd>Gvdiffsplit!<CR>', { noremap = true, silent = true })
-- Mapping for <leader>dg1 to diffget the target branch
vim.api.nvim_set_keymap('n', '<leader>dh', ':diffget //2 <CR>', { noremap = true, silent = true })
-- Mapping for <leader>dg3 to diffget the feature branch
vim.api.nvim_set_keymap('n', '<leader>dl', ':diffget //3 <CR>', { noremap = true, silent = true })
