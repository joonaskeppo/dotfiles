local handlers = require 'joonas.lsp.handlers'

local base_opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
}

local servers = {
    sumneko_lua = require('joonas.lsp.settings.sumneko_lua'),
    clangd = require('joonas.lsp.settings.clangd')
}

local server_keyset = {}
for key, _ in pairs(servers) do
    table.insert(server_keyset, key)
end

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = server_keyset
})

for lang, lang_opts in pairs(servers) do
    local server_opts = vim.tbl_deep_extend('force', lang_opts, base_opts)
    require('lspconfig')[lang].setup(server_opts)
end
