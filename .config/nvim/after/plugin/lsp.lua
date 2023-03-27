local _ = require('lspconfig')

--- handlers ---

-- adapted from:
-- https://github.com/neovim/nvim-lspconfig#suggested-configuration
-- https://github.com/LunarVim/Neovim-from-scratch/blob/06-LSP/lua/user/lsp/handlers.lua

local handlers = {}

handlers.setup = function()
	local config = {
		virtual_text = false,
		update_in_insert = true,
		signs = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
handlers.on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")

	-- Use LSP as the handler for formatexpr.
	vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
    -- COULD WE JUST USE TROUBLE FOR THESE??
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts) -- REDUNDANT???
	vim.keymap.set("n", "<space>lf", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

handlers.lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = require('cmp_nvim_lsp')

handlers.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

--- langs ---

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

--- null-ls ---

local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    debug = false,
    sources = {
        formatting.stylua,
        formatting.prettier,
        formatting.clang_format,
        diagnostics.clj_kondo,
    },
}

