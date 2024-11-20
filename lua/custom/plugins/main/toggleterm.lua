return {
  {
    {
      'akinsho/toggleterm.nvim',
      version = '*',
      config = function()
        function _G.set_terminal_keymaps()
          local opts = { buffer = 0, silent = true }
          -- This is for fish vi keybindings to work in the terminal.
          vim.keymap.set('t', '<esc>', '<esc><leader>', opts)
          vim.keymap.set('t', '<C-w>h', [[<C-\><C-n><C-w>h]], opts)
          vim.keymap.set('t', '<C-w>j', [[<C-\><C-n><C-w>j]], opts)
          vim.keymap.set('t', '<C-w>k', [[<C-\><C-n><C-w>k]], opts)
          vim.keymap.set('t', '<C-w>l', [[<C-\><C-n><C-w>l]], opts)
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

        local colors = require('kanagawa.colors').setup()
        require('toggleterm').setup {
          shell = 'fish -C "source ~/.config/fish/config.fish"',
          size = 20,
          open_mapping = [[<leader>\]],
          shade_terminals = false,
          highlights = {
            Normal = {
              guibg = colors.theme.ui.bg_m1,
            },
          },
          start_in_insert = true,
          insert_mappings = true, -- whether or not the open mapping applies in insert mode
          terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
        }
      end,
    },
  },
}
