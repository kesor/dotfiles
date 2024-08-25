return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      local configs = require("nvim-treesitter.configs")

      vim.opt.foldlevel = 8
      -- vim.opt.foldmethod = 'expr'
      -- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

      configs.setup({
        ensure_installed = {
          "arduino",
          "bash",
          "c",
          "css",
          "diff",
          "dockerfile",
          "dot",
          "elixir",
          "gitattributes",
          "gitcommit",
          "git_config",
          "gitignore",
          "git_rebase",
          "gpg",
          "helm",
          "html",
          "http",
          "ini",
          "javascript",
          "jq",
          "json",
          "lua",
          "luadoc",
          "make",
          "markdown",
          "markdown_inline",
          "mermaid",
          "passwd",
          "python",
          "query",
          "sql",
          "ssh_config",
          "tmux",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "vue",
          "xml",
          "yaml",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
      require("treesitter-context").setup({
        enable = true,
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move, { desc = "Repeat last move" })
      vim.keymap.set(
        { "n", "x", "o" },
        ",",
        ts_repeat_move.repeat_last_move_opposite,
        { desc = "Repeat opposite of last move" }
      )
      -- make builtin f, F, t, T repeatable with ; and ,
      vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

      treesitter.setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
              ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
              ["l="] = { query = "@assignment.lhs", desc = "Select lhs part of an assignment" },
              ["r="] = { query = "@assignment.rhs", desc = "Select rhs part of an assignment" },
              ["aa"] = { query = "@parameter.outer", desc = "Select outer part of an parameter" },
              ["ia"] = { query = "@parameter.inner", desc = "Select inner part of an parameter" },
              ["ai"] = { query = "@conditional.outer", desc = "Select outer part of an conditional" },
              ["ii"] = { query = "@conditional.inner", desc = "Select inner part of an conditional" },
              ["af"] = { query = "@call.outer", desc = "Select outer part of an function call" },
              ["if"] = { query = "@call.inner", desc = "Select inner part of an function call" },
              ["am"] = { query = "@function.outer", desc = "Select outer part of an function definition" },
              ["im"] = { query = "@function.inner", desc = "Select inner part of an function definition" },
              ["ac"] = { query = "@class.outer", desc = "Select outer part of an class region" },
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>na"] = { query = "@parameter.inner", desc = "Swap parameter/argument with next" },
              ["<leader>nm"] = { query = "@function.outer", desc = "Swap function with next" },
            },
            swap_previous = {
              ["<leader>pa"] = { query = "@parameter.inner", desc = "Swap parameter/argument with previous" },
              ["<leader>pm"] = { query = "@function.outer", desc = "Swap function with previous" },
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = { query = "@call.outer", desc = "Next function call start" },
              ["]m"] = { query = "@function.outer", desc = "Next function method/function definition start" },
              ["]c"] = { query = "@class.outer", desc = "Next class start" },
              ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
              ["]l"] = { query = "@loop.outer", desc = "Next loop start" },
              ["]s"] = { query = "@scope", desc = "Next scope" },
              ["]z"] = { query = "@fold", desc = "Next fold" },
            },
            goto_next_end = {
              ["]F"] = { query = "@call.outer", desc = "Next function call end" },
              ["]M"] = { query = "@function.outer", desc = "Next function method/function definition end" },
              ["]C"] = { query = "@class.outer", desc = "Next class end" },
              ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
              ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
            },
            goto_previous_start = {
              ["[f"] = { query = "@call.outer", desc = "Previous function call start" },
              ["[m"] = { query = "@function.outer", desc = "Previous function method/function definition start" },
              ["[c"] = { query = "@class.outer", desc = "Previous class start" },
              ["[i"] = { query = "@conditional.outer", desc = "Previous conditional start" },
              ["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
              ["[s"] = { query = "@scope", desc = "Previous scope" },
              ["[z"] = { query = "@fold", desc = "Previous fold" },
            },
            goto_previous_end = {
              ["[F"] = { query = "@call.outer", desc = "Previous function call end" },
              ["[M"] = { query = "@function.outer", desc = "Previous function method/function definition end" },
              ["[C"] = { query = "@class.outer", desc = "Previous class end" },
              ["[I"] = { query = "@conditional.outer", desc = "Previous conditional end" },
              ["[L"] = { query = "@loop.outer", desc = "Previous loop end" },
            },
          },
        },
      })
    end,
  },
}
