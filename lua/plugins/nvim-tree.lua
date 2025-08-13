-- File explorer; Displays a file tree
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup()
    vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
  end,
}
