return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/src/obsidian/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ibhagwan/fzf-lua",
    "hrsh7th/nvim-cmp",
    "epwalsh/pomo.nvim",
  },
  opts = {
    daily_notes = {
      folder = "Journal/Daily",
      date_format = "%Y-%m-%d",
      template = "Templates/Template - Daily Journal",
    },
    completion = {
      nvim_cmp = true
    },
    workspaces = {
      {
        name = "personal",
        path = "~/src/obsidian/evgeny",
      },
      {
        name = "work",
        path = "~/src/obsidian/doit",
      },
    },
  },
}
