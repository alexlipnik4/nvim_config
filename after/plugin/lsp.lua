local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')
--local lsp_progress = require('lsp-progress')
local masonconfig = require('mason-lspconfig')
local mason = require('mason')
local cmp = require('cmp')

lsp.preset('recommended')

local servers = {
  "tsserver",
  "eslint",
  "lua_ls",
  "bashls",
  "pyright",
  "rust_analyzer"
}

mason.setup({})
masonconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      local lua_opts = lsp.nvim_lua_ls()
      lspconfig.lua_ls.setup(lua_opts)
    end
  }
})

local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)
  return not vim.tbl_isempty(eslintrc)
end

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  lsp.default_keymaps(opts)

  vim.keymap.set('n', '<Leader>d', '<cmd>Telescope lsp_definitions<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'H', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.code_action, opts)

  if not eslint_config_exists() then
    lsp.buffer_autoformat()
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
  else
    vim.keymap.set('n', '<leader>f', ':EslintFixAll<cr>', opts)
  end
end

lsp.on_attach(on_attach)

lsp.format_on_save({
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
    ['pyright'] = { 'python' },
    -- TODO: I hate work
    ['eslint'] = {
      'javascript.js',
      'javascript.jsx',
      'javascriptreact',
      'javascript',
      'typescript',
      'typescript.ts',
      'typescript.tsx',
      'typescriptreact',
      'javascript.json'
    },
  }
})

vim.diagnostic.config({
  signs = true
})


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer

--cmp.setup({
--  formatting = lsp.cmp_format(),
--  mapping = cmp.mapping.preset.insert({
--    -- accept first option
--    ['<CR>'] = cmp.mapping.confirm({ select = true }),
--    -- scroll up and down the documentation window
--    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--    ['<C-d>'] = cmp.mapping.scroll_docs(4),
--  }),
--})
--
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    --{ name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

lsp.setup()
--lsp_progress.setup()
