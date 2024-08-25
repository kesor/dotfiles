return {
  {
    "lukas-reineke/indent-blankline.nvim",
    -- version = "v3.4.2",
    main = "ibl",
    opts = {
      indent = { char = "│" },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "lazy",
          "notify",
          "nvim-tree",
          "trouble",
          "Trouble"
        },
      },
    },
  },
}
