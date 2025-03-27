return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      normal = '#9ccfd8',
      insert = '#ebbcba',
      visual = '#c4a7e7',
      replace = '#eb6f92',
      command = '#f6c177',
      inactive = "#6e6a86",
      bg       = "#1f1d2e",
      fg       = "#e0def4",
      bg_moon = "#232136",
      bg_main = "#191724",
      bg_status_moon = "#2a273f",
      rose = "#ea9a97",
      gold = "#f6c177",
      love = "#eb6f92",
      pine = "#3e8fb0",
      foam = "#9ccfd8",
      iris = "#c4a7e7",
      highlight_low = "#2a283e",
      highlight_med = "#44415a",
      highlight_high = "#56526e",
    }
    local my_lualine_theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.normal, gui = "bold" },
        b = { fg = colors.fg, bg = colors.bg_status_moon },
        c = { fg = colors.fg, bg = colors.bg_moon },
      },
      insert = {
        a = { fg = colors.bg, bg = colors.insert, gui = "bold" },
      },
      visual = {
        a = { fg = colors.bg, bg = colors.visual, gui = "bold" },
      },
      replace = {
        a = { fg = colors.bg, bg = colors.replace, gui = "bold" },
      },
      command = {
        a = { fg = colors.bg, bg = colors.command, gui = "bold" },
      },
      inactive = {
        a = { fg = colors.inactive, bg = colors.bg },
        b = { fg = colors.inactive, bg = colors.bg },
        c = { fg = colors.inactive, bg = colors.bg },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      }
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { "diagnostics" },
        lualine_y = { "filetype" },
        lualine_z = { "location" },
      },
    })
  end,
}
