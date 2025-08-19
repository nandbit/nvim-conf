return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"svelte",
				"ts_ls",
				"pyright",
				"lua_ls",
				"zls",
				"html",
				"cssls",
			},
		})

		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Add nvim-cmp capabilities
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Lua LSP setup
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		-- Other servers
		local servers = { "svelte", "ts_ls", "pyright", "zls", "html", "cssls" }
		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
			})
		end
	end,
}
