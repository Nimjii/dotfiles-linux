-- substitute.lua

return {
  'gbprod/substitute.nvim',
  dependencies = {
    'gbprod/yanky.nvim',
  },
  config = function ()
    require('substitute').setup({
      exchange = {
        preserve_cursor_position = true,
      },
      highlight_substituted_text = {
        enabled = false,
      },
      on_substitute = require('yanky.integration').substitute(),
      preserve_cursor_position = true,
      yank_substituted_text = true,
    })
  end,
  keys = {
    { 's', mode = { 'n' }, function () require('substitute').operator() end, desc = 'Substitute', noremap = true },
    { 'ss', mode = { 'n' }, function () require('substitute').line() end, desc = 'Substitute line', noremap = true },
    { 's', mode = { 'x' }, function () require('substitute').visual() end, desc = 'Substitute', noremap = true },
    { '<leader>s', mode = { 'n' }, function () require('substitute.range').operator() end, desc = 'Substitute over range', noremap = true },
    { '<leader>ss', mode = { 'n' }, function () require('substitute.range').word() end, desc = 'Substitute over range (word)', noremap = true },
    { '<leader>s', mode = { 'x' }, function () require('substitute.range').visual() end, desc = 'Substitute over range', noremap = true },
    { 'sx', mode = { 'n' }, function () require('substitute.exchange').operator() end, desc = 'Exchange', noremap = true },
    { 'sxx', mode = { 'n' }, function () require('substitute.exchange').line() end, desc = 'Exchange line', noremap = true },
    { 'sx', mode = { 'x' }, function () require('substitute.exchange').visual() end, desc = 'Exchange', noremap = true },
  },
}
