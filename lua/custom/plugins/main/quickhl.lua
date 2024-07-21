local function config_function() end

return {
  't9md/vim-quickhl',
  config = config_function,
  event = 'VeryLazy',
  keys = {
    { '<leader>h', '<Plug>(quickhl-manual-this)', mode = 'n', noremap = true, silent = true },
    { '<leader>H', '<Plug>(quickhl-manual-reset)', mode = 'n', noremap = true, silent = true },
  },
}
