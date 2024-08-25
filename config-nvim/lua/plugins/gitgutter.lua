return {
  {
    "airblade/vim-gitgutter",
    config = function()
      --- airblade/vim-gitgutter
      vim.keymap.set(
        "n",
        "[c",
        "<Plug>(GitGutterPrevHunk)",
        { desc = "Previous git change", noremap = true, silent = true }
      )
      vim.keymap.set(
        "n",
        "]c",
        "<Plug>(GitGutterNextHunk)",
        { desc = "Next git change", noremap = true, silent = true }
      )
      vim.keymap.set(
        "n",
        "<Leader>hs",
        "<Plug>(GitGutterStageHunk)",
        { desc = "Stage git hunk", noremap = true, silent = true }
      )
      vim.keymap.set(
        "n",
        "<Leader>hu",
        "<Plug>(GitGutterUndoHunk)",
        { desc = "Unstage git hunk", noremap = true, silent = true }
      )
    end,
  },
}
