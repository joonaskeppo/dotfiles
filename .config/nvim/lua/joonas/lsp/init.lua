local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
    vim.notify('could not load lspconfig')
    return
end

require('joonas.lsp.handlers').setup()
require('joonas.lsp.langs')
