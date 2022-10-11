local plugins = require('joonas/plugins')

-- parts taken/adapted from:
-- - Packer docs
-- - https://github.com/LunarVim/Neovim-from-scratch/blob/03-plugins/lua/user/plugins.lua

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Reload Neovim whenever this or plugins.lua file is saved
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost {plugins,packer}.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("could not load packer")
    return
end

packer.init {
    display = {
        open_fn = function()
            -- Have packer use a popup window
            return require('packer.util').float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    -- Install plugins
    for key, value in pairs(plugins) do
        if type(key) == 'number' then
            use(value)
        else
            table.insert(value, key)
            use(value)
        end
    end

    -- Automatically set up configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)

