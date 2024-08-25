local configlsp = function()
  local lspconfig = require("lspconfig")
  local container = require("lspcontainers")
  local cmp = require("cmp_nvim_lsp")
  local nopid = function(p)
    p.processId = vim.NIL
  end

  -- local capabilities = cmp.default_capabilities(
  --   vim.lsp.protocol.make_client_capabilities()
  -- )
  local capabilities = vim.tbl_deep_extend("force",
    vim.lsp.protocol.make_client_capabilities(),
    cmp.default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  )

  local function extend_list(initial, ...)
    for _, list in ipairs({ ... }) do
      vim.list_extend(initial, list)
    end
    return initial
  end

  -- add border to hover popups
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

  vim.diagnostic.config({
    float = { border = "single" },
  })

  lspconfig.clangd.setup({
    flags = { allow_incremental_sync = true },
    before_init = nopid,
    -- cmd = container.command('clangd'),
    cmd = extend_list(
      vim.list_slice(container.command("clangd"), 0, 8),
      { "--volume=/usr/include:/usr/include:ro" },
      { "docker.io/lspcontainers/clangd-language-server:debian" }
    ),
    capabilities = capabilities,
  })

  lspconfig.bashls.setup({
    flags = { allow_incremental_sync = true },
    before_init = nopid,
    cmd = container.command("bashls"),
    capabilities = capabilities,
  })

  lspconfig.dockerls.setup({
    flags = { allow_incremental_sync = true },
    before_init = nopid,
    cmd = container.command("dockerls"),
    capabilities = capabilities,
  })

  lspconfig.html.setup {
    flags = { allow_incremental_sync = true },
    before_init = nopid,
    cmd = container.command("html"),
    root_dir = lspconfig.util.find_git_ancestor,
    capabilities = capabilities,
  }

  lspconfig.jsonls.setup {
    flags = { allow_incremental_sync = true },
    before_init = nopid,
    cmd = container.command("jsonls"),
    capabilities = capabilities,
    settings = {
      json = {
        schemas = require 'schemastore'.json.schemas {
          select = {
            'Renovate',
            'GitHub Workflow Template Properties',
            'package.json',
            'tsconfig.json'
          }
        },
        validate = { enable = true },
      }
    }
  }

  lspconfig.lemminx.setup {
    flags = { allow_incremental_sync = true },
    cmd = container.command("lemminx"),
    global = { "vim" },
    capabilities = capabilities,
  }

  -- lspconfig.typos_lsp.setup {
  --   flags = { allow_incremental_sync = true },
  --   before_init = nopid,
  --   cmd = container.command "typos_lsp",
  --   capabilities = capabilities,
  -- }

  lspconfig.lua_ls.setup {
    flags = { allow_incremental_sync = true },
    cmd = container.command("lua_ls"),
    global = { "vim" },
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        runtime = { version = "LuaJIT" },
        -- awareness of Neovim runtime files
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      },
    },
  }

  -- lspconfig.vimls.setup {
  --   before_init = nopid,
  --   cmd = container.command 'vimls',
  --   capabilities = capabilities,
  -- }

  -- ## As of 2.0.0, Volar no longer supports TypeScript itself. Instead, a plugin adds Vue support to this language server.
  -- ## Required to install @vue/typescript-plugin together with the typescript-language-server
  -- lspconfig.volar.setup {
  --   flags = { allow_incremental_sync = true },
  --   before_init = nopid,
  --   cmd = vim.lsp.rpc.connect("172.18.0.4", 12348),
  --   capabilities = capabilities,
  -- }

  lspconfig.tailwindcss.setup {
    flags = { allow_incremental_sync = true },
    before_init = nopid,
    cmd = vim.lsp.rpc.connect("172.18.0.2", 12347),
    capabilities = capabilities,
  }

  lspconfig.tsserver.setup {
    flags = { allow_incremental_sync = true },
    before_init = nopid,
    -- cmd = container.command("tsserver"),
    -- cmd = vim.lsp.rpc.connect("172.20.0.2", 12345),
    cmd = vim.lsp.rpc.connect("172.18.0.2", 12345),
    root_dir = lspconfig.util.find_git_ancestor,
    -- on_new_config = function(new_config, new_root_dir)
    --   new_config.cmd = container.command("tsserver")({ root_dir = new_root_dir })
    -- end,
    capabilities = capabilities,
    init_options = {
      embeddedLanguages = {
        html = true,
      },
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
          languages = { "javascript", "typescript", "vue" },
        },
      },
    },
    filetypes = {
      "javascript",
      "typescript",
      "vue",
    },
  }

  lspconfig.eslint.setup({
    flags = { allow_incremental_sync = true },
    before_init = nopid,
    -- cmd = container.command("eslintls"),
    -- cmd = vim.lsp.rpc.connect("172.20.0.2", 12346),
    cmd = vim.lsp.rpc.connect("172.18.0.2", 12346),
    -- root_dir = lspconfig.util.root_pattern(unpack(eslint_files)),
    -- on_new_config = function(new_config)
    --   --- new_config.cmd = container.command('eslintls', { root_dir = new_root_dir })
    --   new_config.settings.workspaceFolder = {
    --     uri = lspconfig.util.find_git_ancestor(vim.fn.getcwd()),
    --   }
    -- end,
    on_attach = function(_, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
    capabilities = capabilities,
    filetypes = {
      "json",
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
    },
    settings = {
      packageManager = 'yarn',
      nodePath = '/usr/local/bin/node',
      useFlatConfig = true,
      -- experimental = {
      --   useFlatConfig = true,
      -- },
      esling = {
        debug = true
      },
      codeActionOnSave = {
        enable = true
      }
    }
  })

  lspconfig.pyright.setup({
    before_init = nopid,
    cmd = container.command("pyright"),
    capabilities = capabilities,
  })

  lspconfig.helm_ls.setup {
    before_init = nopid,
    capabilities = capabilities,
    cmd = container.command('helmls')
  }

  lspconfig.yamlls.setup {
    before_init = nopid,
    capabilities = capabilities,
    cmd = container.command('yamlls'),
    root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
    settings = {
      yaml = {
        validate = true,
        schemaStore = {
          -- disable the schema store
          enable = false,
          url = "",
        },
        schemas = require 'schemastore'.yaml.schemas {
          select = {
            'docker-compose.yml'
          }
        }
      }
    }
  }

  lspconfig.taplo.setup {
    before_init = nopid,
    capabilities = capabilities,
    cmd = container.command('taplo'),
    settings = {
      evenBetterToml = {
        schema = {
          associations = {
            ['example\\.toml$'] = 'https://json.schemastore.org/example.json',
          }
        }
      }
    }
  }
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/SchemaStore.nvim",
      "lspcontainers/lspcontainers.nvim",
    },
    config = configlsp,
  },
  {
    "lspcontainers/lspcontainers.nvim",
    dev = true,
    dir = '~/src/nvim/lspcontainers.nvim',
    version = '0.0.1-kesor',
  },
}
