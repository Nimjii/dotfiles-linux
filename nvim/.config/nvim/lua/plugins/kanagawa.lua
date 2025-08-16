-- gruvbox.lua

return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  config = function ()
    require('kanagawa').setup({
      keywordStyle = {},
      dimInactive = true,
    })

    vim.cmd('colorscheme kanagawa-wave')
  end,
}
