--[[
This plugins just changes the status line a little bit, making it more pretty
]]--
return {
	'nvim-mini/mini.nvim',
	enable = true,
	version = "*",
	config = function()
		require('mini.statusline').setup({use_icons = true})
	end
}
