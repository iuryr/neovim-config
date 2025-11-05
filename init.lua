--Load package manager as soon as it can
--Plugins are loaded from individual files in lua/config/plugins
require("config.lazy")

--Load lsp configurations (mostly autocmds) that are useful regardless of language
--Language specific configurations are at lsp/implementation.lua files
require("config.lsp")
--activate relevant lsps
vim.lsp.enable({ 'lua', 'basedpyright', 'clangd' })

---------------------- KEYMAPS -------------------------
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")                                     --source current file
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = 'E[x]ecute Lua code in current line' })    --execute lua code in current line
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = 'E[x]ecute Lua code in visual selection' }) --execute lua code in visual selection
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
-- In the next two keymap sets, we need to create a function so that we can call vim.diagnostic.jump and pass parameters
-- to each call. The table to the right (where we define desc) is used by the set function, not by the
-- function we are attaching to said keymap. We do not need to do this to the other keymaps because the functions
-- are called without arguments
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = 1, float = true, }) end,
  { desc = "Go to next diagnostic message" })
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = -1, float = true, }) end,
  { desc = "Go to previous diagnostic message" })

---------------------- OPTIONS -------------------------
-- sync with system clipboard
vim.opt.clipboard = "unnamedplus"
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
-- one column in the gutter (for gitsigns plugin)
vim.o.signcolumn = "yes:1"
--global diagnostic config
vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = false,
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}



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
