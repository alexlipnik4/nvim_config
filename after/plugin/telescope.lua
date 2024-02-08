local telescope = require('telescope')
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
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
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
      end,
      attach_mappings = function(prompt_bufnr, map)
        map('i', '<CR>', function()
          actions.close(prompt_bufnr)
        end)
        return true
      end,
    },
  },
})
