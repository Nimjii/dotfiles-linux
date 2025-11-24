-- leap.lua

return {
  'ggandor/leap.nvim',
  config = function()
    local leap = require 'leap'
    local remote = require 'leap.remote'
    local user = require 'leap.user'

    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)', { desc = 'Leap' })
    vim.keymap.set({ 'n' }, 'S', '<Plug>(leap-from-window)', { desc = 'Leap from window' })

    vim.keymap.set({ 'n', 'o' }, 'gs', function()
      remote.action()
    end, { desc = 'Leap remote action' })

    vim.keymap.set({ 'n', 'o' }, 'gS', function()
      remote.action { input = 'V' }
    end)

    vim.keymap.set({ 'x', 'o' }, 'R', function()
      require('leap.treesitter').select {
        opts = user.with_traversal_keys('R', 'r'),
      }
    end)

    leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }
    leap.opts.preview = function(ch0, ch1, ch2)
      return not (ch1:match '%s' or (ch0:match '%a' and ch1:match '%a' and ch2:match '%a'))
    end

    user.set_repeat_keys('<enter>', '<backspace>')
  end,
}
