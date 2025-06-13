-- AstroUI provides the basis for configuring the AstroNvim User Interface

---@type LazySpec
return {
	"AstroNvim/astroui",
	---@type AstroUIOpts
	opts = {
		-- Change colorscheme
		colorscheme = "tokyonight",

		highlights = {
			init = {
				Normal = { bg = "#000000" },
				NormalNC = { bg = "#000000" },
				NormalFloat = { bg = "#000000" },
				FloatBorder = { bg = "#000000" },
				VertSplit = { bg = "#000000" },
				SignColumn = { bg = "#000000" },
				StatusLine = { bg = "#000000" },
				StatusLineNC = { bg = "#000000" },
			},
		},

		-- UI icons
		icons = {
			LSPLoading1 = "⠋",
			LSPLoading2 = "⠙",
			LSPLoading3 = "⠹",
			LSPLoading4 = "⠸",
			LSPLoading5 = "⠼",
			LSPLoading6 = "⠴",
			LSPLoading7 = "⠦",
			LSPLoading8 = "⠧",
			LSPLoading9 = "⠇",
			LSPLoading10 = "⠏",
		},

		-- Status line
		status = {
			separators = {
				path = "  ",
				breadcrumbs = "  ",
			},
		},
	},
}
