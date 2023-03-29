-- Invokable after colorscheme + lush plugins available
local colorscheme = 'zenbones'
vim.o.background = 'light'
vim.g.zenbones_lightness = 'bright'
vim.g.zenbones_italic_comments = true
vim.cmd('colorscheme ' .. colorscheme)
