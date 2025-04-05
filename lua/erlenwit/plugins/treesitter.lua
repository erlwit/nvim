return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      autotag = {
        enable = true,
      },
      ensure_installed = {
        -- Shell
        "bash",
        -- Vim
        "vim",
        "vimdoc",
        "lua",
        -- Config
        "yaml",
        "json",
        -- Git
        "gitignore",
        "git_config",
        "git_rebase",
        -- Docker
        "dockerfile",
        -- C/CPP
        "c",
        "cpp",
        "cmake",
        -- Documentation
        "doxygen",
        "markdown",
        -- Python
        "python",
        "requirements",
        -- Qt
        "qmldir",
        "qmljs",
        -- Config
        "ssh_config",
        -- Misc
        "regex",
        "comment",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
