-- treesitter.lua

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup()

    require('nvim-treesitter').install({
      'bash',
      'csv',
      'cpp',
      'diff',
      'dockerfile',
      'editorconfig',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
      'go',
      'ini',
      'java',
      'javascript',
      'jsdoc',
      'json',
      'lua',
      'luadoc',
      'make',
      'markdown',
      'markdown_inline',
      'passwd',
      'python',
      'regex',
      'rust',
      'sql',
      'toml',
      'typescript',
      'vim',
      'vimdoc',
      'xml',
      'yaml'
    })
  end,
}
