return {
  {
    'EdenEast/nightfox.nvim',
    event = 'VimEnter',
    priority = 1000,
    init = function()
      -- Default options
      require('nightfox').setup {
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath 'cache' .. '/nightfox',
          compile_file_suffix = '_compiled', -- Compiled file suffix
          transparent = true, -- Disable setting background
          terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = true, -- Non focused panes set to alternative background
          module_default = true, -- Default enable value for modules
          colorblind = {
            enable = false, -- Enable colorblind support
            simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
            severity = {
              protan = 0, -- Severity [0,1] for protan (red)
              deutan = 0, -- Severity [0,1] for deutan (green)
              tritan = 0, -- Severity [0,1] for tritan (blue)
            },
          },
          styles = { -- Style to be applied to different syntax groups
            comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
            conditionals = 'NONE',
            constants = 'NONE',
            functions = 'NONE',
            keywords = 'bold',
            numbers = 'NONE',
            operators = 'NONE',
            strings = 'NONE',
            types = 'italic,bold',
            variables = 'NONE',
          },
          inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
          modules = { -- List of various plugins and additional options
            -- ...
          },
        },
        palettes = {},
        specs = {},
        groups = {},
      }

      vim.cmd.colorscheme 'nordfox'

      vim.cmd [[
 " transparent all the things
 "      hi Normal ctermbg=NONE guibg=NONE
      hi NormalNC ctermbg=NONE guibg=NONE
      hi NormalSB ctermbg=NONE guibg=NONE
      hi EndOfBuffer ctermbg=NONE guibg=NONE
      hi FloatTitle ctermbg=NONE guibg=NONE
      hi NormalFloat ctermbg=NONE guibg=NONE

      " highlight for borders
      hi FloatBorder ctermbg=NONE guibg=NONE guifg=#CCCCCC
]]
    end,
  },
}
