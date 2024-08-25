-- don't use default mappings
vim.g.tmux_navigator_no_mappings = 1

return {
  {
    "christoomey/vim-tmux-navigator",
    config = function()
      vim.keymap.set(
        { "n", "v" },
        "<M-C-h>",
        ":<C-U>TmuxNavigateLeft<cr>",
        { desc = "Cross-pane tmux/vim navigate left", noremap = true, silent = true }
      )
      vim.keymap.set(
        { "n", "v" },
        "<M-C-j>",
        ":<C-U>TmuxNavigateDown<cr>",
        { desc = "Cross-pane tmux/vim navigate down", noremap = true, silent = true }
      )
      vim.keymap.set(
        { "n", "v" },
        "<M-C-k>",
        ":<C-U>TmuxNavigateUp<cr>",
        { desc = "Cross-pane tmux/vim navigate up", noremap = true, silent = true }
      )
      vim.keymap.set(
        { "n", "v" },
        "<M-C-l>",
        ":<C-U>TmuxNavigateRight<cr>",
        { desc = "Cross-pane tmux/vim navigate right", noremap = true, silent = true }
      )
      vim.keymap.set(
        { "n", "v" },
        "<M-C-Tab>",
        ":<C-U>TmuxNavigatePrevious<cr>",
        { desc = "Cross-pane tmux/vim navigate previous", noremap = true, silent = true }
      )
    end,
  },
}
