--Load package manager as soon as it can
--Plugins are loaded from individual files in lua/config/plugins
require("config.lazy")

--activate relevant lsps
vim.lsp.enable({'lua', 'basedpyright'})


---------------------- KEYMAPS -------------------------
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>") --source current file
vim.keymap.set("n", "<space>x", ":.lua<CR>") --excute lua code in current line
vim.keymap.set("v", "<space>x", ":lua<CR>") --excute lua code in visual selection


---------------------- OPTIONS -------------------------
vim.opt.clipboard = "unnamedplus"

vim.diagnostic.config({virtual_text = true}) --lsp warnings for the whole buffer



---------------------- CUSTOM THINGS -------------------

-- Highlight when yanking (copying) text
-- Try it with yap in normal mode
-- See `help: vim.highlight.on_yank()`
-- mechanics: listen to the TextYankPost event and calls callback function when it happens
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
