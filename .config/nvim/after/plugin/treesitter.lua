local installer = require('nvim-treesitter.install')
local configs = require('nvim-treesitter.configs')

installer.update { with_sync = true }

configs.setup {
    ensure_installed = "all",
    sync_installed = false,
    ignore_install = { "phpdoc" }, -- seems to be borked atm (`npm install` error)
    highlight = {
        enable = true,
        disable = { "sql" }, -- some issues likely due to HugSQL syntax
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
