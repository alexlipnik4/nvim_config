local ts_config = require('nvim-treesitter.configs')

ts_config.setup {
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s',
      },
      typescript = { __default = '// %s', __multiline = '/* %s */' }
    },
  },
  ensure_installed = {
    "vimdoc",
    "vim",
    "markdown",
    "javascript",
    "typescript",
    "bash",
    "lua",
  },

  indent = { enable = true },
  rainbow = { enable = true },
}

require('ts_context_commentstring.internal').update_commentstring({
  key = '__multiline',
})

require('ts_context_commentstring.internal').calculate_commentstring {
  location = require('ts_context_commentstring.utils').get_cursor_location(),
}
