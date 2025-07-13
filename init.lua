-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
	-- stylua: ignore
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
		lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
	-- stylua: ignore
	vim.api.nvim_echo(
		{ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },
		true, {})
	vim.fn.getchar()
	vim.cmd.quit()
end

require("lazy_setup")
require("polish")

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.highlight("Normal", "guibg=#000000")

vim.keymap.set("n", "<leader>r", function()
	vim.cmd('vsplit | terminal g++ "%:p" -o a.out && ./a.out')
end)

-- 🚀 Super Flashy Cursor Setup with Per-Mode Color + Blinking
vim.opt.guicursor = {
	-- Normal, Visual, Command: blinking block
	"n-v-c:block-CursorNormal-blinkon500-blinkoff300",
	-- Insert: blinking vertical bar
	"i-ci:ver25-CursorInsert-blinkon300-blinkoff200",
	-- Replace: blinking horizontal bar
	"r-cr:hor20-CursorReplace-blinkon250-blinkoff200",
	-- Operator-pending
	"o:hor50-CursorOperator",
	-- Visual-exclude
	"ve:ver35-CursorVisual",
	-- All others: no blink
	"a:blinkon0",
}

-- 🎨 Custom highlight groups for flashy cursors
vim.api.nvim_set_hl(0, "CursorNormal", { bg = "#9D7CD8", fg = "#000000" }) -- Purple
vim.api.nvim_set_hl(0, "CursorInsert", { bg = "#00FF88", fg = "#000000" }) -- Neon Green
vim.api.nvim_set_hl(0, "CursorReplace", { bg = "#FF0055", fg = "#000000" }) -- Bright Red
vim.api.nvim_set_hl(0, "CursorOperator", { bg = "#FFD700", fg = "#000000" }) -- Gold
vim.api.nvim_set_hl(0, "CursorVisual", { bg = "#00FFFF", fg = "#000000" }) -- Cyan

-- 🧼 Prevent ugly pink color (inverted default)
vim.api.nvim_set_hl(0, "Cursor", {}) -- disables default reverse Cursor
