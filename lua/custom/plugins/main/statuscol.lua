return {
  {
    'luukvbaal/statuscol.nvim',
    event = 'VimEnter',
    config = function(which)
      local builtin = require 'statuscol.builtin'
      require('statuscol').setup {
        relculright = true,
        segments = {
          { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
          { text = { builtin.lnumfunc }, click = 'v:lua.ScLa' },
          {
            sign = { namespace = { 'gitsigns', 'diagnostic/signs' } },
            hl = 'CursorLineSign',
            click = 'v:lua.ScSa',
          },
        },
      }

      local signs = { Error = '！', Warn = '！', Hint = '！', Info = '！' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
}
