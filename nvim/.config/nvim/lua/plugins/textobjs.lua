-- textobjs.lua

return {
  'chrisgrieser/nvim-various-textobjs',
  opts = {
    keymaps = {
      useDefaults = false,
    },
  },
  keys = {
    { 'ii', mode = { 'o', 'x' }, function () require('various-textobjs').indentation('inner', 'inner') end, desc = 'inner-inner indentation' },
    { 'ai', mode = { 'o', 'x' }, function () require('various-textobjs').indentation('outer', 'inner') end, desc = 'outer-inner indentation' },
    { 'aI', mode = { 'o', 'x' }, function () require('various-textobjs').indentation('outer', 'outer') end, desc = 'outer-outer indentation' },
    { 'is', mode = { 'o', 'x' }, function () require('various-textobjs').subword('inner') end, desc = 'inner subword' },
    { 'as', mode = { 'o', 'x' }, function () require('various-textobjs').subword('outer') end, desc = 'outer subword' },
    { 'gG', mode = { 'o', 'x' }, function () require('various-textobjs').entireBuffer() end, desc = 'entire buffer' },
  },
}
