-- File: lua/plugins/none-ls.lua

---@type LazySpec
return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = function(_, opts)
		local null_ls = require("null-ls")

		opts.sources = require("astrocore").list_insert_unique(opts.sources, {
			-- Blade formatter
			null_ls.builtins.formatting.blade_formatter.with({
				command = "blade-formatter",
				args = {
					"-i",
					vim.opt.tabstop:get(),
					"--sort-tailwindcss-classes",
					"--indent-inner-html",
					"--write",
					"$FILENAME",
				},
			}),

			-- Prettier (for PHP/HTML/JS)
			null_ls.builtins.formatting.prettier.with({
				extra_filetypes = { "php", "html" },
			}),
		})
	end,

	config = function(_, opts)
		local null_ls = require("null-ls")
		null_ls.setup(opts)

		-- Auto format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				vim.lsp.buf.format({ bufnr = args.buf })
			end,
		})
	end,
}
