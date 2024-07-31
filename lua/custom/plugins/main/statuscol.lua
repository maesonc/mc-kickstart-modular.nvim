return {
  {
    'luukvbaal/statuscol.nvim',
    event = 'VimEnter',
    config = function(which)
      local builtin = require 'statuscol.builtin'
      require('statuscol').setup {
        relculright = true,
        segments = {
          { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
          -- { text = { ' %s' }, hl = 'CursorLineSign', click = 'v:lua.ScSa' },
          {
            sign = { namespace = { 'diagnostic/signs' } },
            hl = 'CursorLineSign',
            click = 'v:lua.ScSa',
          },
          { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
        },
      }
      local signs = { Error = ' 󱞟', Warn = ' 󱞟', Hint = ' 󱞟', Info = ' 󱞟' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
      -- vim.fn.sign_define('LspDiagnosticsSignError', { texthl = 'LspDiagnosticsSignError', text = '', numhl = 'LspDiagnosticsSignError' })
      -- vim.fn.sign_define('LspDiagnosticsSignWarning', { texthl = 'LspDiagnosticsSignWarning', text = '', numhl = 'LspDiagnosticsSignWarning' })
      -- vim.fn.sign_define('LspDiagnosticsSignHint', { texthl = 'LspDiagnosticsSignHint', text = '', numhl = 'LspDiagnosticsSignHint' })
      -- vim.fn.sign_define('LspDiagnosticsSignInformation', { texthl = 'LspDiagnosticsSignInformation', text = '', numhl = 'LspDiagnosticsSignInformation' })
    end,
  },
}
