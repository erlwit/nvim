return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    local function os_icon()
      local osname = vim.loop.os_uname().sysname
      if osname == "Darwin" then
        return ''
      elseif osname == "Linux" then
        return ""
      elseif osname:match("Windows") then
        return ""
      else
        return "🖥️"
      end
    end
    local function filetype_and_os()
      local ft_icon = require("nvim-web-devicons").get_icon_by_filetype(vim.bo.filetype) or ""
      local os = os_icon()
      return ft_icon .. " " .. os
    end
    local function line_and_total()
      local current = vim.fn.line(".")
      local total = vim.fn.line("$")
      local width = tostring(total):len()

      -- Pad the current line number with spaces to match total's digit width
      return string.format("%" .. width .. "d:%d", current, total)
    end

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
      bg_overlay = "#393552",
      rose = "#ea9a97",
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
        b = { fg = colors.fg, bg = colors.bg_overlay, gui = "bold" },
        c = { fg = colors.fg, bg = colors.bg_status_moon, gui = "bold" },
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
        a = { fg = colors.inactive, bg = colors.bg},
        b = { fg = colors.inactive, bg = colors.bg},
        c = { fg = colors.inactive, bg = colors.bg},
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = ' ' },
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
        lualine_a = {
          {
            "mode",
            separator = { left = "    ", right = "" },
          },
        },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { "diagnostics" },
        lualine_y = { 
          {
             "filetype",
             icon_only = true,
             padding = { left = 1, right = 0 },
          },
          {
             os_icon,
             padding = { left = 0, right = 2 },
          },
        },
        lualine_z = {
          {
            line_and_total,
            separator = { left = "", right = "    " },
          },
        },
      },
    })
  end,
}
