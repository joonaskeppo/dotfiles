-- Dark scheme
--[[ local colorscheme = 'kanagawabones' ]]
--[[ vim.o.background = 'dark' ]]

-- Light scheme
local colorscheme = 'zenbones'
vim.o.background = 'light'
vim.g.zenbones_lightness = 'bright'
vim.g.zenbones_italic_comments = true

--[[ local colorscheme = 'yui'; ]]
--[[ vim.o.background = 'light'; ]]

local status_ok, _  = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

