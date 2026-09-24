return {
  'folke/snacks.nvim',
  priority = 900,
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,
      width = 60,
      preset = {
        header = [[
    ███╗   ██╗██╗   ██╗██╗███╗   ███╗
    ████╗  ██║██║   ██║██║████╗ ████║
    ██╔██╗ ██║██║   ██║██║██╔████╔██║
    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        keys = {
          { icon = ' ', key = 'f', desc = 'Find file', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'g', desc = 'Search text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 'n', desc = 'New file', action = ':ene | startinsert' },
          {
            icon = ' ',
            key = 'c',
            desc = 'Neovim config',
            action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
          },
          { icon = '󰒲 ', key = 'l', desc = 'Plugin manager', action = ':Lazy' },
          { icon = '󰅚 ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
      sections = {
        { section = 'header' },
        function()
          return {
            section = 'keys',
            gap = vim.o.lines >= 32 and 1 or 0,
            padding = 1,
          }
        end,
        function()
          return {
            align = 'center',
            text = {
              {
                '  ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':~'),
                hl = 'SnacksDashboardDir',
              },
            },
            padding = 1,
          }
        end,
      },
    },
  },
  config = function(_, opts)
    require('snacks').setup(opts)

    local function set_dashboard_highlights()
      local links = {
        SnacksDashboardNormal = 'Normal',
        SnacksDashboardHeader = 'Function',
        SnacksDashboardIcon = 'Special',
        SnacksDashboardKey = 'Keyword',
        SnacksDashboardDesc = 'Normal',
        SnacksDashboardTitle = 'Title',
        SnacksDashboardDir = 'Comment',
        SnacksDashboardFooter = 'Comment',
      }

      for group, target in pairs(links) do
        vim.api.nvim_set_hl(0, group, { link = target })
      end
    end

    set_dashboard_highlights()
    vim.api.nvim_create_autocmd('ColorScheme', {
      group = vim.api.nvim_create_augroup('custom_snacks_dashboard', { clear = true }),
      callback = set_dashboard_highlights,
    })
  end,
}
