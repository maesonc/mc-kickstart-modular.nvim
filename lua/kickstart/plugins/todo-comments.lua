-- Highlight todo, notes, etc in comments
return {
  {
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function()
      require('todo-comments').setup {
        signs = false,
      }
    end,
    config = {
      vim.keymap.set('n', ']t', function()
        require('todo-comments').jump_next()
      end, { desc = 'Next todo comment' }),

      vim.keymap.set('n', '[t', function()
        require('todo-comments').jump_prev()
      end, { desc = 'Previous todo comment' }),
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
