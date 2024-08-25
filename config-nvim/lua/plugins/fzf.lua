return {
  {
    "ibhagwan/fzf-lua",
    config = function()
      local fzflua = require("fzf-lua")
      fzflua.setup({ "fzf-tmux" })
      -- ** done in dressing.nvim ** fzflua.register_ui_select({}, true) -- register as ui for vim.ui.select (silent)
      vim.keymap.set("n", "<C-Tab>", fzflua.buffers, { desc = "Buffers list", noremap = true, silent = true })
      vim.keymap.set("n", "<C-P>", fzflua.files, { desc = "Find and open files", noremap = true, silent = true })
      vim.keymap.set("n", "<C-g>", fzflua.grep, { desc = "Grep", noremap = true, silent = true })
      vim.keymap.set("n", "<S-C-L>", fzflua.live_grep_native, { desc = "Live grep", noremap = true, silent = true })
      vim.keymap.set("n", "<C-l>", fzflua.lines, { desc = "Live grep", noremap = true, silent = true })
      vim.keymap.set("n", "<S-C-m>", fzflua.keymaps, { desc = "Find vim keymaps", noremap = true, silent = true })
      vim.keymap.set(
        "n",
        "<S-C-k>",
        "<cmd>FzfLua builtin<cr>",
        { desc = "Find fzf-lua builtin functions", noremap = true, silent = true }
      )
      vim.keymap.set(
        { "n", "v", "i" },
        "<C-x><C-f>",
        fzflua.complete_path,
        { desc = "Fuzzy complete path", noremap = true, silent = true }
      )

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("FzfLspConfig", {}),
        callback = function(ev)
          local function opts(description)
            local options = { desc = description, noremap = true, silent = true }
            options.buffer = ev.buf
            return options
          end
          vim.keymap.set("n", "gr", fzflua.lsp_references, opts("LSP References"))
          vim.keymap.set("n", "gd", fzflua.lsp_definitions, opts("LSP Definitions"))
          vim.keymap.set("n", "gD", fzflua.lsp_declarations, opts("LSP Declarations"))
          vim.keymap.set("n", "<space>D", fzflua.lsp_typedefs, opts("LSP Type Definitions"))
          vim.keymap.set("n", "gi", fzflua.lsp_implementations, opts("LSP Implementations"))
          vim.keymap.set("n", "<S-C-P>", fzflua.lsp_live_workspace_symbols, opts("LSP Live Workspace Symbols"))
          vim.keymap.set({ "n", "v" }, "<space>ca", fzflua.lsp_code_actions, opts("LSP Code actions"))
          vim.keymap.set("n", "<space>q", fzflua.quickfix, opts("Quickfix"))
          vim.keymap.set("n", "<space>F", fzflua.lsp_finder, opts("LSP Finder"))
        end,
      })
    end,
  },
}
