local handlers = require 'joonas.plugins.lsp.handlers'

local base_opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
}

local servers = {
    sumneko_lua = require('joonas.plugins.lsp.settings.sumneko_lua'),
    clangd = require('joonas.plugins.lsp.settings.clangd'),
    clojure_lsp = require('joonas.plugins.lsp.settings.clojure_lsp'),
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
