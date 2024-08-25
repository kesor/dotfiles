local cmpconfig = function()
  vim.opt.completeopt = "longest,menuone,preview"

  local cmp = require("cmp")

  vim.keymap.set("i", "<C-x><C-o>", cmp.complete, { desc = "CMP Autocomplete" })
  vim.keymap.set("n", "<LocalLeader>tcd", function()
    cmp.setup.buffer { enabled = false }
  end, { desc = "Turn CMP off" })
  vim.keymap.set("n", "<LocalLeader>tce", function()
    cmp.setup.buffer { enabled = true }
  end, { desc = "Turn CMP on" })

  local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  -- configure ...
  cmp.setup({
    experimental = {
      ghost_text = true,
      native_menu = false,
    },
    formatting = {
      format = require("lspkind").cmp_format({
        mode = "symbol_text",
      }),
    },
    sources = cmp.config.sources({
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "vsnip" },
      { name = "buffer",  keyword_length = 5 },
    }, {
      { name = "buffer" },
    }),
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.fn["vsnip#available"](1) == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end, { "i", "s" }),
    }),
  })

  -- `/` cmdline setup.
  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
      { name = "cmdline_history" },
    },
  })

  -- `:` cmdline setup.
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
      {
        name = "cmdline_history",
        option = {
          treat_trailing_slash = false
        }
      },
      { name = "cmdline" },
    }),
  })
end

return {
  {
    "hrsh7th/vim-vsnip",
    lazy = false,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
      "dmitmel/cmp-cmdline-history",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "onsails/lspkind.nvim",
    },
    config = cmpconfig,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
}
