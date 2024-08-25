local prefix = "<Leader>x"

return {
  {
    "folke/trouble.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble" },
    keys = {
      { prefix .. "x", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)", },
      { prefix .. "X", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)", },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)", },
      { prefix .. "l", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)", },
      { prefix .. "L", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)", },
      { prefix .. "Q", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)", },
    },
  },
}
