local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- movment
  "ziontee113/syntax-tree-surfer",

  --git

  --blame
  'f-person/git-blame.nvim',

  ---- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':tsupdate',
  },
  'nvim-treesitter/nvim-treesitter-context',

  'nvim-lua/plenary.nvim',

  ---- tmux & split window navigation
  'christoomey/vim-tmux-navigator',

  -- bookmarks
  'tomasky/bookmarks.nvim',
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- optional: for git status
      'nvim-tree/nvim-web-devicons', -- optional: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },

  -- lsp
  {
    { 'vonheikemen/lsp-zero.nvim',        branch = 'v3.x' },

    -- lsp support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },

    -- autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'l3mon4d3/luasnip' },
    { 'saadparwaiz1/cmp_luasnip' },
  },

  ---- ai completion
  --'exafunction/codeium.vim',

  ---- trouble
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  ---- files & navigation
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  ---- git
  'lewis6991/gitsigns.nvim',
  {
    'neogitorg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },

  ---- test
  'klen/nvim-test',

  ---- rust
  'simrat39/rust-tools.nvim',

  ---- code tools
  'rrethy/vim-illuminate', -- highlight keyword
  'tpope/vim-commentary',  -- comment/uncomments
  'folke/which-key.nvim',

  ---- start page
  'goolord/alpha-nvim',

  ---- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'muniftanjim/nui.nvim',
    }
  },

  ---- notes

  ---- ui, notifications & messages
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  -- status
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      {
        'nvim-tree/nvim-web-devicons',
        'linrongbin16/lsp-progress.nvim',
        opt = true
      }
    }
  },
  {
    'linrongbin16/lsp-progress.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  --memento
  'gaborvecsei/memento.nvim',

  ---- nvim-tree icons
  'nvim-tree/nvim-web-devicons',

  ---- themes
  'oxfist/night-owl.nvim',
  'shaunsingh/moonlight.nvim',
  'dracula/vim',
  {
    'folke/tokyonight.nvim',
    lazy = false,
    opts = {},
  },
  'EdenEast/nightfox.nvim',
  { 'rose-pine/neovim', name = 'rose-pine' },
}

require("lazy").setup(plugins)
