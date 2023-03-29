local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Basics of navigation, the sane defaults
-- * <C-w> for all window-based stuff 
-- * Jumplist with <C-i> (older) and <C-i> (newer), also <C-t> for popping LSP tag stack
-- * Marks with m; capital letters for global marks (e.g., mA), lower-case letters for buffer-local marks (e.g., ma)
--   * Jump to mark with ' (e.g., 'a or 'A)

-- Leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Sourcing
keymap("n", "<leader><cr>", "<cmd>:so ~/.config/nvim/init.lua<cr>", opts)

-- Buffers
keymap("n", "<S-l>", "<cmd>bnext<cr>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<cr>", opts)

-- Indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Yankage
keymap("v", "p", '"_dP', opts) -- continue pasting the thing that was previously yanked

-- Navigation
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<leader>ff", "<cmd>Telescope find_files find_command=rg,--hidden,--files<cr>", opts)
keymap("n", "<space>fF", "<cmd>Telescope file_browser<cr>", opts)
keymap("n", "<leader>fp", "<cmd>Telescope git_files find_command=rg,--hidden,--files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

-- Diagnostics
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
keymap("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", opts)
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap("n", "<space>ld", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
