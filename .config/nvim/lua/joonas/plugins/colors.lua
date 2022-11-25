local colorscheme = 'yui'

vim.o.background = 'light'

vim.g.zenbones_lightness = 'bright'
vim.g.zenbones_italic_comments = true

--[[ vim.g.gruvbox_material_background = 'medium' ]]
--[[ vim.g.gruvbox_material_better_performance = 1 ]]

local status_ok, _  = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

