return {
  {
    "kosayoda/nvim-lightbulb",
    enabled = false,
    config = function()
      require("nvim-lightbulb").setup({
        action_kinds = { "quickfix" },
        autocmd = { enabled = true },
        sign = { enabled = false },
        ignore = {
          ft = { "neo-tree" },
          actions_without_kind = true,
        },
      })
    end,
  },
}
