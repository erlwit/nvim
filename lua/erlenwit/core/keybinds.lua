vim.g.mapleader = " "
vim.opt.timeout = true
vim.opt.timeoutlen = 1000  -- default is 1000ms, try 200ms or even 100

local keymap = vim.keymap

keymap.set("i", "<leader>q", "<ESC>", { desc = "Exit insert mode with leader-q" })
keymap.set("n", "<leader>q", ":nohl<CR>", { desc = "Clear highligh search with leader-q" })
keymap.set("n", "+", "$", { desc = "Go to end of line with pluss" })

-- Explore
keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "Enter Explorer mode with <leader>e"})

-- Save and source
vim.keymap.set("n", "<leader>s", function()
  vim.cmd("write")
  local ft = vim.bo.filetype
  if ft == "lua" or ft == "vim" then
    vim.cmd("source %")
  end
end, { desc = "Save and source current config file" })

-- window management
keymap.set("n", "<leader>-", "<C-w>s", { desc = "Spilt window horizontally" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Spilt window horizontally" })
keymap.set("n", "<leader>|", "<C-w>v", { desc = "Spilt window vertically" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Spilt window vertically" })
keymap.set("n", "<leader>$", "<C-w>v", { desc = "Spilt window vertically" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current pane" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Set panes to equal size" }) 

-- vim tmux navigation
keymap.set("n", "<leader>h", "<C-h>", { remap=true, desc = "Move to pane on the left of current" })
keymap.set("n", "<leader>l", "<C-l>", { remap=true, desc = "Move to pane on the right of current" })
keymap.set("n", "<leader>k", "<C-k>", { remap=true, desc = "Move to pane on top of current" })
keymap.set("n", "<leader>j", "<C-j>", { remap=true, desc = "Move to pane belowcurrent" })

-- nvim tree
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file"  })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer"  })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer"  })

