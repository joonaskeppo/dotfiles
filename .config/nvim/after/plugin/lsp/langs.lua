local handlers = require("after.plugin.lsp.handlers")

local base_opts = {
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
}

local default_server_config = { settings = {} }

local servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
				telemetry = {
					enable = false,
				},
			},
		}
	},
	clangd = default_server_config,
	clojure_lsp = default_server_config,
	sqlls = default_server_config,
}

local server_keyset = {}
for key, _ in pairs(servers) do
	table.insert(server_keyset, key)
end

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = server_keyset,
})

for lang, lang_opts in pairs(servers) do
	local server_opts = vim.tbl_deep_extend("force", lang_opts, base_opts)
	require("lspconfig")[lang].setup(server_opts)
end
