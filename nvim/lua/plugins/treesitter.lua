return { 
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    require 'nvim-treesitter.install'.prefer_git = false

    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "javascript", "typescript" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
