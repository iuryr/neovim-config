return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    require('telescope').setup({
      extensions = {
        fzf = {}
      }
    })

    require('telescope').load_extension('fzf')

    vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)  --find in help
    vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files) --find files in cwd
    vim.keymap.set("n", "<space>en", function()                               -- find in neovim config directory
      require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath('config')
      }
    end)
  end
}
