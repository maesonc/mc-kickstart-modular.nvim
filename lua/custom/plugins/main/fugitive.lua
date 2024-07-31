return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.api.nvim_set_keymap('n', '<Leader>gh', ':Gdiffsplit <CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>gv', ':Gvdiffsplit <CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>gs', ':Git <CR>:resize 15<CR>', { noremap = true })
    end,
  },
}
