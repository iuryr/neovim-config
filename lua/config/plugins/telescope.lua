return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    --basic setup
    require('telescope').setup({
      extensions = {
        fzf = {}
      }
    })
    require('telescope').load_extension('fzf')

    --keymaps
    vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)  --find in help
    vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files) --find files in cwd
    vim.keymap.set("n", "<space>en", function()                               -- find in neovim config directory
      require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath('config')
      }
    end)
    vim.keymap.set("n", "<space>ep", function() -- find in packages source code
      require('telescope.builtin').find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy')
      }
    end)
  end
}
