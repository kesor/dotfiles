return {
  {
    "epwalsh/pomo.nvim",
    version = "*", -- use latest release (not latest commit)
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat" },
    opts = {
      sticky = false,
      title_icon = "󱎫",
      text_icon = "󰄉",
    },
    dependencies = {
      "rcarriga/nvim-notify",
    },
  },
}
