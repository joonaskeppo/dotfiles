local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Windows
keymap("n", "<leader>2", "<cmd>split<cr>", opts)
keymap("n", "<leader>3", "<cmd>vsplit<cr>", opts)
keymap("n", "<leader>1", "<cmd>only<cr>", opts)
keymap("n", "<leader>0", "<cmd>close<cr>", opts)

-- Buffers
keymap("n", "<S-l>", "<cmd>bnext<cr>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<cr>", opts)

-- Indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Yankage
keymap("v", "p", '"_dP', opts) -- continue pasting the thing that was previously yanked

-- Files
keymap("n", "<space>fb", "<cmd>Telescope file_browser<cr>", opts)

-- Navigation
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<leader>ff", "<cmd>Telescope find_files find_command=rg,--hidden,--files<cr>", opts)
keymap("n", "<leader>fp", "<cmd>Telescope git_files find_command=rg,--hidden,--files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)


