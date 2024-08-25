return {
  {
    "echasnovski/mini.indentscope",
    version = false,
    opts = {
      symbol = "│",
      draw = {
        delay = 50,
      },
      options = { try_as_border = true },
    },
  },
  {
    "echasnovski/mini.clue",
    version = false,
    config = function()
      local miniclue = require("mini.clue")
      miniclue.setup({
        window = {
          delay = 500,
        },
        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },
          { mode = "n", keys = "<LocalLeader>" },
          { mode = "x", keys = "<LocalLeader>" },
          { mode = "i", keys = "<C-x>" },
          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },
          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },
          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },
          -- Window commands
          { mode = "n", keys = "<C-w>" },
          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
          -- `[]` keys
          { mode = "n", keys = "]" },
          { mode = "n", keys = "[" },
          { mode = "x", keys = "[" },
          { mode = "x", keys = "]" },
          -- 'y' key
          { mode = 'n', keys = 'y' },
          { mode = 'x', keys = 'y' },
        },
      })
    end,
  },
  {
    "echasnovski/mini.cursorword",
    version = false,
    opts = {},
  },
  {
    "echasnovski/mini.files",
    config = function()
      require'mini.files'.setup({
        windows = {
          preview = true,
        }
      })
      local map_split = function(buf_id, lhs, direction)
        local mf = require'mini.files'
        local rhs = function()
          -- Make new window and set it as target
          local new_target_window
          vim.api.nvim_win_call(mf.get_target_window(), function()
            vim.cmd(direction .. ' split')
            new_target_window = vim.api.nvim_get_current_win()
          end)

          mf.set_target_window(new_target_window)
        end

        -- Adding `desc` will result into `show_help` entries
        local desc = 'Split ' .. direction
        vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
      end

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesBufferCreate',
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak keys to your liking
          map_split(buf_id, 'gs', 'belowright horizontal')
          map_split(buf_id, 'gv', 'belowright vertical')
        end,
      })
    end,
    keys = {
      { "<LocalLeader>e", function ()
        local mf = require'mini.files'
        if not mf.close() then mf.open(vim.api.nvim_buf_get_name(0), false) end
      end, desc = "Toggle MiniFiles" },
    },
  },
}
