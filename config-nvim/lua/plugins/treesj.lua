return {
  {
    "Wansmer/treesj",
    keys = {
      {
        "<Leader>m",
        "<cmd>TSJToggle<cr>",
        desc = "Toggle Treesitter join",
      }
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
  },
}
