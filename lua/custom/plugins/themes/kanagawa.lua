return {
  {
    'rebelot/kanagawa.nvim',
    event = 'VimEnter',
    priority = 1000,
    init = function()
      require('kanagawa').setup {
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = { bold = true, italic = false },
        keywordStyle = { bold = false, italic = false },
        statementStyle = { bold = true, italic = false },
        typeStyle = { bold = true, italic = false },
        transparent = true, -- do not set background color
        dimInactive = true, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          local pal = colors.palette
          return {

            -- DiagnosticError = { fg = colors.palette.waveRed },
            NormalNC = { bg = 'NONE' },
            NormalSB = { bg = 'NONE' },
            EndOfBuffer = { bg = 'NONE' },
            FloatTitle = { bg = 'NONE' },
            NormalFloat = { bg = 'NONE' },

            -- highlight for borders
            FloatBorder = { bg = 'NONE' },
            WinSeparator = { bg = 'NONE', fg = pal.fujiWhite },
            VertSplit = { bg = 'NONE', fg = 'NONE' },
            LineNr = { bg = 'NONE', fg = pal.winterYellow },
            CursorLine = { bg = pal.waveBlue1 },
            CursorLineNr = { bg = pal.waveBlue1, fg = pal.carpYellow },

            -- Column next to the Line number
            SignColumn = { bg = 'NONE' },
            StatusLineNC = { bg = 'NONE' },
            InactiveWindow = { bg = '#1e1e1e', fg = '#5c6370' },
          }
        end,
        background = { -- map the value of 'background' option to a theme
          dark = 'dragon', -- try "dragon" !
          light = 'lotus',
        },
      }
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
}
