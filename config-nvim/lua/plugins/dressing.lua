return {
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    opts = {
      input = {
        enabled = true,
      },
      select = {
        enabled = true,
        backend = { "fzf_lua" },
      },
    },
  },
}
