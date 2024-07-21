return {
  {
    'miversen33/sunglasses.nvim',
    config = {
      -- SHADE, TINT, NOSYNTAX
      filter_type = 'SHADE',
      filter_percent = 0.55,
    },
    event = 'UIEnter',
    vim.keymap.set('n', '<C-s>', ':SunglassesEnableToggle <CR>', { desc = 'Sunglasses Toggle' }),
  },
}
