-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
  hijack_netrw = false,
  sync_root_with_cwd = true,
  -- change folder arrow icons
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "none",
    root_folder_label = ":t",
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
    icons = {
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      glyphs = {
        folder = {
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  update_focused_file = {
    enable = true,
    debounce_delay = 15,
    update_root = true,
    ignore_list = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
  },

  view = {
    adaptive_size = true,
    relativenumber = true,
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})

vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufReadPost * NvimTreeCollapse
    autocmd BufReadPost * NvimTreeFindFile
  augroup end
]])
