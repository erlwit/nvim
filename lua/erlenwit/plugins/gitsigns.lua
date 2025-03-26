return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()
  end,
  event = { "BufReadPre", "BufNewFile" }, -- optional: lazy load on file open
}
