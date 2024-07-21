return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.api.nvim_set_keymap('n', '<Leader>Gh', ':Gdiffsplit <CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>Gv', ':Gvdiffsplit <CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>Gi', ':Git<CR>:15wincmd<CR>', { noremap = true })
    end,
  },
}
