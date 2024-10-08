local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end

vim.opt.rtp:prepend(lazypath)

local opts = {
  dev = {
    path = "~/src/nvim",
    fallback = true,
  },
  checker = {
    enabled = true,
  },
  -- change_detection = {
  --   notify = true,
  -- },
  ui = {
    border = "single",
  },
}

require("lazy").setup("plugins", opts)
