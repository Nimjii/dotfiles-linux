-- lspconfig.lua

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'mason-org/mason.nvim',
      opts = {},
    },

    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },

    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    'folke/which-key.nvim',

    'saghen/blink.cmp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        require('which-key').add {
          { '<leader>l', group = 'LSP', icon = '󰚔' },
          { '<leader>lr', vim.lsp.buf.rename, desc = 'Rename symbol' },
          { '<leader>la', vim.lsp.buf.code_action, desc = 'Code action' },
          { '<leader>lf', vim.lsp.buf.format, desc = 'Format buffer' },
        }

        vim.keymap.set('n', 'K', function()
          vim.lsp.buf.hover { border = 'rounded' }
        end, { buffer = event.buf, desc = 'LSP: Hover documentation' })

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
        end
      end,
    })

    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      },
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }

          return diagnostic_message[diagnostic.severity]
        end,
      },
    }

    local servers = {
      clangd = {},
      gopls = {},
      rust_analyzer = {},
      ts_ls = {},

      jdtls = {
        cmd = { 'jdtls', '-data', vim.fn.getcwd() },
        init_options = {
          extendedClientCapabilities = {
            classFileContentsSupport = true,
            generateToStringPromptSupport = true,
            hashCodeEqualsPromptSupport = true,
            advancedExtractRefactoringSupport = true,
            advancedOrganizeImportsSupport = true,
            generateConstructorsPromptSupport = true,
            generateDelegateMethodsPromptSupport = true,
            moveRefactoringSupport = true,
            overrideMethodsPromptSupport = true,
            executeClientCommandSupport = true,
            inferSelectionSupport = {
              "extractMethod",
              "extractVariable",
              "extractConstant",
              "extractVariableAllOccurrence",
            },
          },
        },
        root_markers = { '.git', 'gradlew', 'mvnw' },
        settings = {
          java = {
            configuration = {
              runtimes = {
                { name = "JavaSE-25", path = '/usr/lib/jvm/java-25-openjdk/' },
                { name = "JavaSE-21", path = '/usr/lib/jvm/java-21-openjdk/' },
              },
            },
          },
        },
      },

      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            diagnostics = {
              disable = {
                'missing-fields',
              },
            },
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
          },
        },
      },
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, { 'stylua' })

    require('mason-lspconfig').setup {
      automatic_enable = vim.tbl_keys(servers or {}),
    }

    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    for server_name, config in pairs(servers) do
      vim.lsp.config(server_name, config)
    end

    vim.lsp.set_log_level 'off'
  end,
}
