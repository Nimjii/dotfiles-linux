-- @module autocmds.lua

-- [[ Handle trailing whitespaces and empty lines ]]
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*' },
  callback = function ()
    require('utils').trim_whitespaces()
    require('utils').trim_empty_lines()
  end,
})

-- [[ Add bindings for netrw ]]
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  callback = function ()
    vim.keymap.set({ 'n' }, '<leader>e', '<cmd>bd<cr>', { buffer = true, desc = 'Close netrw' })
  end,
})
