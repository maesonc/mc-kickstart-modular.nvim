return {
  {
    'voldikss/vim-floaterm',
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>\\', ':FloatermToggle<CR>', { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap('t', '<leader>\\', '<Esc> <C-\\><C-n> :FloatermToggle<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('t', '<leader>closefloat', '<Esc> <C-\\><C-n>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('t', '<leader>\\', '<leader>closefloat:FloatermToggle<CR>', { noremap = false, silent = true })

      vim.cmd [[
      let g:floaterm_width =0.5 
      let g:floaterm_height = 0.5
      let g:floaterm_wintype = 'float'
      let g:floaterm_position = 'bottomright'
      let g:floaterm_title = 'Terminal $1|$2'
      let g:floaterm_borderchars = '─│─│╭╮╯╰'
      let g:floaterm_autoinsert = v:true ]]
    end,
  },
}
