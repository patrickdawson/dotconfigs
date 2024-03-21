return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>po", ":Neotree toggle left<CR>", {})
    vim.keymap.set("n", "<leader>pf", ":Neotree reveal left<CR>", {})
  end,
}
