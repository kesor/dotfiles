-- minimal.lua

local cmpconfig = function()
  vim.opt.completeopt = "longest,menuone,preview"
  local cmp = require"cmp"
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" }
    }, {
      { name = "cmdline_history" },
      { name = "cmdline" }
    })
  })
end

local plugins = {
  { "hrshth/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-cmdline"
    },
    config = cmpconfig
  }
}

local opts = {
  checker = { enabled = true }
}

vim.opt.rtp:prepend( vim.fn.stdpath"data" .. "/lazy/lazy.nvim" )
require"lazy".setup(plugins, opts)
