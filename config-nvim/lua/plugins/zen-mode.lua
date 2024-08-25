return {
  {
    "folke/zen-mode.nvim",
    opts = {
      width = 120,
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
        },
        twilight = { enabled = true },
        tmux = { enabled = true },
        kitty = { enabled = true },
      },
    },
  },
}
