local orgmode = require('orgmode')

orgmode.setup_ts_grammar()

vim.cmd [[
    autocmd FileType org setlocal nofoldenable
]]
