return {
  { -- Fuzzy Finder (files, lsp, etc)
    'kevinhwang91/nvim-ufo',
    event = 'VeryLazy',
    dependencies = {
      { 'kevinhwang91/promise-async' },
    },
    config = function()
      vim.cmd [[
      hi Folded ctermbg=NONE guibg=NONE guifg=#DCD7BA
      hi FoldColumn ctermbg=NONE guibg=NONE guifg=#DCD7BA
      ]]

      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = [[eob: ,fold: ,foldopen:󰅀,foldsep: ,foldclose:󰅂]]

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set('n', ']z', 'zj', { noremap = true, silent = true })
      vim.keymap.set('n', '[z', 'zk', { noremap = true, silent = true })
      vim.keymap.set('n', 'zz', 'za', { noremap = true, silent = true })
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      vim.keymap.set('n', 'zH', function()
        local winid = require('ufo').peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end)

      vim.api.nvim_set_hl(0, 'FoldSuffix', { fg = '#E6C384' }) -- Set desired color for suffix
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = { ' ·····', 'FoldSuffix' }
        local sufWidth = vim.fn.strdisplaywidth(suffix[0])
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, suffix)

        return newVirtText
      end

      require('ufo').setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end,
        fold_virt_text_handler = handler,
      }
    end,
  },
}
