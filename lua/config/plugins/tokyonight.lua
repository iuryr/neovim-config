--Plugin with some colorschemes
--Options:
--	tokyonight
--	tokyonight-night
--	tokyonight-storm
--	tokyonight-day
--	tokyonight-moon
return {
	"folke/tokyonight.nvim",
	enabled = true,
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("tokyonight")
	end
}
