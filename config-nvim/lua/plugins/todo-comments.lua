return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local tc = require("todo-comments")
    tc.setup()
    vim.keymap.set("n", "]t", tc.jump_next, { desc = "Next todo comment", noremap = true, silent = true })
    vim.keymap.set("n", "[t", tc.jump_prev, { desc = "Previous todo comment", noremap = true, silent = true })
  end,
}
