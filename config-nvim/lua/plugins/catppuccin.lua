return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
  opts = {
    flavour = "mocha",
    color_overrides = {
      mocha = {
        base = "#181825",
      },
    },
    custom_highlights = function()
      return {
        Normal = { bg = "#010203" },
        NormalNC = { bg = "#010203" },
        NormalFloat = { bg = "#010203" },
        Folded = { bg = "#010203" },
        NvimTreeNormal = { bg = "#010203" },
        NvimTreeNormalNC = { bg = "#010203" },
        NvimTreeNormalFloat = { bg = "#010203" },
        FzfNormal = { bg = "#010203" },
        FzfLuaNormal = { bg = "#010203" },
        FzfLuaPreviewNormal = { bg = "#010203" },
      }
    end,
    integrations = {
      beacon = true,
      cmp = true,
      fidget = true,
      gitgutter = true,
      illuminate = { enabled = true, lsp = true },
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      lsp_trouble = true,
      mini = { enabled = true },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = { background = true },
      },
      navic = { enabled = true },
      notify = true,
      nvimtree = true,
      treesitter_context = true,
      treesitter = true,
      ufo = true,
    },
  },
}
