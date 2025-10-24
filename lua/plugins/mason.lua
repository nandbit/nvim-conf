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

		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		local servers = { "svelte", "ts_ls", "pyright", "zls", "html", "cssls" }
		for _, server in ipairs(servers) do
			vim.lsp.config(server, {
				capabilities = capabilities,
			})
		end
	end,
}

