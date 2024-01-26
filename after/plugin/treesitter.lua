local ts_config = require('nvim-treesitter.configs')

ts_config.setup {
  ensure_installed = {
    "vimdoc",
    "vim",
    "markdown",
--    "javascript",
--    "typescript",
    "bash",
    "lua",
  },

  indent = { enable = true },
  rainbow = { enable = true },
}
