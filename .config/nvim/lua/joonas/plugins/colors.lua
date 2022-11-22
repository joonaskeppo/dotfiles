local colorscheme = 'gruvbox-flat'

vim.o.background = 'dark'
vim.g.gruvbox_flat_style = 'dark'

local status_ok, _  = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

