-- mini.lua

return {
  'echasnovski/mini.nvim',
  version = false,
  config = function ()
    require('mini.git').setup()
    require('mini.icons').setup()

    require('mini.ai').setup({
      custom_textobjects = {
        a = false,
        t = false,
      },
    })

    require('mini.comment').setup({
      options = {
        ignore_blank_line = true,
      },
    })

    require('mini.diff').setup({
      view = {
        signs = {
          add = '+',
          change = '~',
          delete = '-'
        },
      },
      mappings = {
        apply = '<leader>gs',
        reset = '<leader>gr',
        textobject = 'ih',
      },
    })

    require('mini.move').setup({
      mappings = {
        left = 'H',
        right = 'L',
        down = 'J',
        up = 'K',

        line_left = '',
        line_right = '',
        line_down = '',
        line_up = '',
      },
    })

    require('mini.pairs').setup({
      modes = { insert = false },
    })

    require('mini.pairs').map('i', '(', { action = 'open', pair = '()', neigh_pattern = '[^\\].' })
    require('mini.pairs').map('i', '{', { action = 'open', pair = '{}', neigh_pattern = '[^\\].' })
    require('mini.pairs').map('i', '[', { action = 'open', pair = '[]', neigh_pattern = '[^\\].' })

    MiniIcons.mock_nvim_web_devicons()
  end,
  keys = {
    { '<leader>gd', mode = 'n', function () require('mini.diff').toggle_overlay() end, desc = 'Show diff overlay' },
    { '<leader>gs', mode = 'n', function () require('mini.git').show_at_cursor() end, desc = 'Show at cursor' },
    { '<leader>gr', mode = 'x', function () require('mini.git').show_range_history() end, desc = 'Show range history' },
  },
}
