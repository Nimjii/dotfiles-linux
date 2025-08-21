-- snacks.lua

return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    bigfile = {
      enabled = true,
    },
    dim = {
      animate = {
        enabled = false,
      },
    },
    indent = {
      animate = {
        enabled = false,
      },
      filter = function (buf)
        return vim.g.snacks_indent ~= false
          and vim.b[buf].snacks_indent ~= false
          and vim.bo[buf].buftype == ""
          and vim.bo.filetype ~= 'markdown'
      end,
    },
    input = {
      enabled = true,
    },
    picker = {
      formatters = {
        file = {
          truncate = 100,
        },
      },
      matcher = {
        frecency = true,
      },
      sources = {
        explorer = {
          auto_close = true,
          git_status_open = true,
          hidden = true,
          ignored = true,
          layout = {
            preset = 'default',
            preview = true,
            layout = {
              width = 0.95,
              height = 0.9,
            },
          },
          win = {
            list = {
              keys = {
                ['<c-c>'] = { 'close', mode = { 'n', 'i' } },
              },
            },
          },
        },
      },
      win = {
        input = {
          keys = {
            ['<c-c>'] = { 'close', mode = { 'n', 'i' } },
          },
        },
        list = {
          keys = {
            ['<c-c>'] = { 'close', mode = { 'n', 'i' } },
          },
        },
      },
    },
    statuscolumn = {
      enabled = true,
    },
    styles = {
      input = {
        relative = 'cursor',
        row = -3,
        col = 0,
      },
      terminal = {
        border = 'rounded',
        position = 'float',
        wo = {
          winhighlight = 'FloatBorder:Normal',
        },
        keys = {
          term_hide = { '<F7>', 'hide', mode = { 't', 'n' }, desc = 'Hide terminal' },
        },
      },
    },
    words = {
      enabled = true,
    },
  },
  keys = {
    { 'gd', mode = 'n', function () require('snacks.picker').lsp_definitions() end, desc = 'Go to definition' },
    { 'gD', mode = 'n', function () require('snacks.picker').lsp_declarations() end, desc = 'Go to declaration' },
    { 'gI', mode = 'n', function () require('snacks.picker').lsp_implementations() end, desc = 'Go to implementation' },
    { 'gr', mode = 'n', function () require('snacks.picker').lsp_references() end, desc = 'Go to references' },
    { 'gt', mode = 'n', function () require('snacks.picker').lsp_type_definitions() end, desc = 'Type definition' },
    { '<leader>b', mode = 'n', function () require('snacks.git').blame_line() end, desc = 'Blame current line' },
    { '<leader>fd', mode = 'n', function () require('snacks.picker').diagnostics() end, desc = 'Find diagnostics' },
    { '<leader>fG', mode = 'n', function () require('snacks.picker').git_status() end, desc = 'Find modified files' },
    { '<leader>fs', mode = { 'n', 'x' }, function () require('snacks.picker').grep_word({ hidden = true, ignored = true }) end, desc = 'Find word under cursor' },
    { '<leader>fS', mode = 'n', function () require('snacks.picker').lsp_symbols() end, desc = 'Document symbols' },
    { '<leader>f<CR>', mode = 'n', function () require('snacks.picker').resume() end, desc = 'Resume last search' },
    { '<leader><space>', mode = 'n', function () require('snacks.picker').buffers() end, desc = 'Find existing buffers' },
    { '<leader>ff', mode = 'n', function () require('snacks.picker').files({ hidden = true }) end, desc = 'Find files' },
    { '<leader>fF', mode = 'n', function () require('snacks.picker').files({ hidden = true, ignored = true }) end, desc = 'Find all files' },
    { '<leader>/', mode = 'n', function () require('snacks.picker').grep({ hidden = true }) end, desc = 'Search in files' },
    { '<leader>fw', mode = 'n', function () require('snacks.picker').grep({ hidden = true, ignored = true }) end, desc = 'Search in all files' },
    { '<leader>ho', mode = 'n', function () require('snacks.gitbrowse').open({ what = 'commit' }) end, desc = 'Open commit url' },
    { '<leader>hf', mode = 'n', function () require('snacks.gitbrowse').open() end, desc = 'Open file url' },
    { '<F7>', mode = { 'n', 'i' }, function () require('snacks').terminal() end, desc = 'Floating terminal' },
  },
}
