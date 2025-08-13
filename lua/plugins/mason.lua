return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "svelte",
        "ts_ls",
        "pyright",
        "lua_ls",
        "zls",
        "html",
        "cssls",
      },
    })

    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    local servers = { "svelte", "ts_ls", "pyright", "zls", "html", "cssls" }
    for _, server in ipairs(servers) do
      if server ~= "lua_ls" then
        lspconfig[server].setup({})
      end
    end
  end,
}

