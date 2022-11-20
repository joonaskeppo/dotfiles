--[[ local status_ok, _ = pcall(require, "rnvimr") ]]
--[[ if not status_ok then ]]
--[[     vim.notify('could not load rnvimr') ]]
--[[     return ]]
--[[ end ]]

vim.g.rnvimr_ex_enable = 1 -- replace netrw
vim.g.rnvimr_draw_border = 1
vim.g.rnvimr_pick_enable = 1
vim.g.rnvimr_bw_enable = 1
