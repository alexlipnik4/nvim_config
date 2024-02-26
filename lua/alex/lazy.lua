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
  'mbbill/undotree',
  -- noice
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",

  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- },

  --diff git
  'sindrets/diffview.nvim',

  -- -- fold lines
  -- { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' },

  -- markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- bookmarks
  -- option 2
  {
    'crusj/bookmarks.nvim',
    keys = {
      { "<tab><tab>", mode = { "n" } },
    },
    branch = 'main',
    dependencies = { 'nvim-web-devicons' },
    config = function()
      require("bookmarks").setup()
      require("telescope").load_extension("bookmarks")
    end
  },

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
  --'jomasky/bookmarks.nvim',
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- optional: for git status
      'nvim-tree/nvim-web-devicons', -- optional: for ile icons
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

  -- comment
  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('ts_context_commentstring').setup({
        enable_autocmd = false,
      })
    end
  },
  -- {
  --   'numToStr/Comment.nvim',
  --   config = function()
  --     local prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
  --     require("Comment").setup({
  --       padding = true,
  --       sticky = true,
  --       ignore = "^$",
  --       toggler = {
  --         line = "gcc",
  --         block = "gbc",
  --       },
  --       opleader = {
  --         line = "gc",
  --         block = "gb",
  --       },
  --       extra = {
  --         above = "gcO",
  --         below = "gco",
  --         eol = "gcA",
  --       },
  --       mappings = {
  --         basic = true,
  --         extra = true,
  --         extended = false,
  --       },
  --       pre_hook = prehook,
  --       post_hook = nil,
  --     })
  --   end,
  --   event = "BufReadPre",
  --   lazy = false,
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  -- },

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
  --{
  --  'folke/trouble.nvim',
  --  dependencies = { 'nvim-tree/nvim-web-devicons' },
  --},
  -- lsp trouble
  {
    "folke/lsp-trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
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
  'tomasiser/vim-code-dark',
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
