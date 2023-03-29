vim.cmd [[set termguicolors]]

-- Spacing
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true -- inserts spaces for tabs
vim.o.smartindent = true

-- Windows
vim.o.number = true -- show line numbers
vim.o.relativenumber = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.cursorline = true -- highlight current line
vim.o.wrap = false -- don't wrap long lines
vim.o.scrolloff = 8 -- start scrolling at offset of 8 lines

-- Editing
vim.cmd('set iskeyword +=-') -- this-is-one-word (so `dw` would delete the entire thing)
vim.o.completeopt = "menuone,noselect" -- insert mode completion
vim.o.guicursor = ""

-- Folding
vim.cmd('set foldmethod=indent')
vim.cmd('set nofoldenable')

-- Files
vim.o.fileencoding = "utf-8"
vim.o.writebackup = true
vim.o.swapfile = false

-- Popups
vim.o.pumheight = 10 -- popup menu height

-- Search
vim.o.ignorecase = true -- ignore case in search patterns
vim.o.smartcase = true

-- Misc
vim.o.termguicolors = true -- "Enables 24-bit RGB color in the |TUI|"
vim.o.clipboard = 'unnamedplus' -- use mac clipboard
vim.o.mouse = 'a' -- ensure proper mouse support

