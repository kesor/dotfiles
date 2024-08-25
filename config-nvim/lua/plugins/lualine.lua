local function get_schema()
  local schema = require("yaml-companion").get_buf_schema(0)
  if schema.result[1].name == "none" then
    return ""
  end
  return schema.result[1].name
end

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        icons_enabled = true,
        theme = "catppuccin",
        component_separators = "│",
        section_Separators = "",
        extensions = { "fugitive", "fzf", "nvim-tree", "trouble", "lazy" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          'encoding',
          'fileformat',
          'filetype',
          'filename',
          get_schema,
        },
        lualine_x = {
          function()
            local ok, pomo = pcall(require, "pomo")
            if not ok then
              return ""
            end

            local timer = pomo.get_first_to_finish()
            if timer == nil then
              return ""
            end

            return "󰄉 " .. tostring(timer)
          end,
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = "#ff9e64" },
          },
        },
      },
    },
  },
}
