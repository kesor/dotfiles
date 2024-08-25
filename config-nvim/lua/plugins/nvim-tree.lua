return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    cmd = { "NvimTreeToggle", "NvimTreeClose", 'NvimTreeOpen' },
    -- keys = {
    --   { "<LocalLeader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
    -- },
    -- init = function()
    --   vim.api.nvim_create_autocmd({ "QuitPre" }, {
    --     callback = function()
    --       vim.cmd("NvimTreeClose")
    --     end,
    --   })
    -- end,
    opts = {
      disable_netrw = true,
      select_prompts = true, -- use vim.ui.select
      view = {
        centralize_selection = true,
        preserve_window_proportions = true,
        signcolumn = "auto",
        width = {
          min = 20,
          max = 40,
        },
      },
      renderer = {
        add_trailing = true,
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "icon",
        highlight_diagnostics = true,
        highlight_modified = "icon",
        icons = {
          web_devicons = {
            folder = { enable = true },
          },
        },
        indent_markers = {
          enable = true,
        },
      },
      modified = { enable = true },
      diagnostics = { enable = true },
      git = { enable = true },
      update_focused_file = { enable = true },
    },
  },
}
