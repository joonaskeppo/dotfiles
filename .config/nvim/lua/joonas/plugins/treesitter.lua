local status_ok, installer = pcall(require, "nvim-treesitter.install")
if not status_ok then
    return
else
    installer.update { with_sync = true }
end


local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = 'all',
    sync_installed = false,
    ignore_install = { "phpdoc" }, -- seems to be borked atm (`npm install` error)
    highlight = {
        enable = true,
        disable = { "" },
    },
    additional_vim_regex_highlighting = false,
    indent = {
        enable = true,
        disable = { "" },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    context_commentstring = {
        enable = true,
    },
}
