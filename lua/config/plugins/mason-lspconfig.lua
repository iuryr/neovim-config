return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = { "lua_ls", "basedpyright", "clangd" }
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
  },
}
