return {
  {
    'preservim/nerdtree',
    dependencies = {
      'ryanoasis/vim-devicons',
    },
    init = function()
      vim.api.nvim_set_keymap('n', '<Leader>nt', ':NERDTreeToggle <CR>', { noremap = true })
    end,
  },
}
