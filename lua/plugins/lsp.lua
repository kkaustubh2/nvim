return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- Mason Setup
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"intelephense",
					"html",
					"emmet_ls",
				},
			})

			-- LSP Config
			local lspconfig = require("lspconfig")

			-- PHP LSP
			lspconfig.intelephense.setup({})

			-- HTML LSP (enable in .php files too)
			lspconfig.html.setup({
				filetypes = { "html", "php" },
			})

			-- Emmet LSP (for HTML/CSS abbreviation expansion)
			lspconfig.emmet_ls.setup({
				filetypes = { "html", "css", "php" },
				init_options = {
					html = {
						options = {
							["bem.enabled"] = true,
						},
					},
				},
			})
		end,
	},
}
