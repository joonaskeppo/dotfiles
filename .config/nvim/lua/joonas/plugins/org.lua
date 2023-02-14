local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
    vim.notify("failed to load orgmode")
    return
end

orgmode.setup_ts_grammar{}

vim.cmd [[
    autocmd FileType org setlocal nofoldenable
]]
