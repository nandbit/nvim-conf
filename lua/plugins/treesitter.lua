-- Syntax highlighting and code parsing
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- auto-update parsers
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "python", "javascript", "typescript", "html", "css" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
