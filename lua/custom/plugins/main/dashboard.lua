return {
  {
    'maesonc/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Todo',
              group = 'DiagnosticHint',
              action = 'TodoTelescope keywords=TODO,FIX,BUG,WARN,WARNING,PERF',
              key = 't',
            },
            {
              desc = '󰈞 Grep',
              group = 'Number',
              action = 'Telescope live_grep',
              key = 'g',
            },
          },
          packages = { enable = true }, -- show how many plugins neovim loaded
          project = { enable = false, limit = 50, action = 'Telescope find_files cwd=' },
          mru = { enable = true, limit = 3 },
        },
      }
    end,
    requires = { 'nvim-tree/nvim-web-devicons' },
  },
}
