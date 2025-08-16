-- conform.lua

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = false,
    format_on_save = false,
    formatters_by_ft = {
      lua = { 'stylua' },
    },
  },
  keys = {
    {
      '<leader><S-P>',
      mode = '',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      desc = 'Format buffer',
    },
  },
}
