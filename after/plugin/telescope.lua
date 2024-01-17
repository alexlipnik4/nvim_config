local telescope = require('telescope')
local builtin = require('telescope.builtin')
local theme = {
  hidden = true,
}

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

telescope.setup({
  defaults = {
    winblend = 8,
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
  },
  pickers = {
    find_files = theme,
    grep_string = theme,
    oldfiles = theme,
    git_files = theme,
    buffers = theme,
    colorscheme = {
      enable_preview = true,
      on_change = function(colorscheme)
        SetColorscheme(colorscheme)
      end
    }
  }
})

