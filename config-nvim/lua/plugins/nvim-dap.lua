local prefix = "<Leader>D"
return {
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = true,
    opts = {}
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap" },
    lazy = true,
    opts = {},
  },
  {
    "rcarriga/nvim-dap-ui",
    opts = {},
    keys = {
      { prefix .. "u", "<cmd>lua require('dapui').toggle()<cr>", desc = "Debug UI Toggle" },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require('nvim-dap-virtual-text') -- make lazy load the plugin
      require('dap-vscode-js') -- make lazy load the plugin
      local function opendapui()
        dapui.open()
      end

      local function closedapui()
        dapui.close()
      end

      dap.listeners.before.attach.dapui_config = opendapui
      dap.listeners.before.launch.dapui_config = opendapui
      dap.listeners.before.event_terminated.dapui_config = closedapui
      dap.listeners.before.event_exited.dapui_config = closedapui
    end,
    keys = {
      { prefix, desc = "Debugger" },
      { prefix .. "t", "<cmd>DapToggleBreakpoint<cr>", desc = "Debug Toggle Breakpoint" },
      { prefix .. "c", "<cmd>DapContinue<cr>", desc = "Debug Continue" },
      { prefix .. "o", "<cmd>DapStepOut<cr>", desc = "Debug Step Out" },
      { prefix .. "i", "<cmd>DapStepInto<cr>", desc = "Debug Step Into" },
      { prefix .. "v", "<cmd>DapStepOver<cr>", desc = "Debug Step Over" },
      { prefix .. "K", "<cmd>lua require('dap.ui.widgets').hover()<cr>", desc = "Debug Hover" },
      { prefix .. "p", "<cmd>lua require('dap.ui.widgets').preview()<cr>", desc = "Debug Preview" },
    },
  },
}
