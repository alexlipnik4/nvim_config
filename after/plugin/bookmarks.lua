--Option 1
--require('bookmarks').setup {
--  -- sign_priority = 8,  --set bookmark sign priority to cover other sign
--  save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
--  keywords = {
--    ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
--    ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
--    ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
--    ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
--  },
--  on_attach = function()
--    local bm = require "bookmarks"
--    local map = vim.keymap.set
--    map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line map("n","mi",bm.bookmark_ann) -- add or edit mark annotation at current line
--    map("n", "mc", function()
--      bm.bookmark_clean()
--    end
--    ) -- clean all marks in local buffer
--    map("n", "mn", function()
--      bm.bookmark_next()
--      vim.cmd("normal! zz")
--    end
--    ) -- jump to next mark in local buffer
--    map("n", "mp", function()
--      bm.bookmark_prev()
--      vim.cmd("normal! zz")
--    end
--    )                                               -- jump to previous mark in local buffer
--    map("n", "ml", ':Telescope bookmarks list<CR>') -- jump to previous mark in local buffer
--  end
--}
--
--require('telescope').load_extension('bookmarks')
--
--vim.keymap.set('n', '<leader>ml', ':Telescope bookmarks list<CR>')


--Option2
require("bookmarks").setup({
  storage_dir = "", -- Default path: vim.fn.stdpath("data").."/bookmarks,  if not the default directory, should be absolute path",
  mappings_enabled = true, -- If the value is false, only valid for global keymaps: toggle、add、delete_on_virt、show_desc
  keymap = {
    toggle = "<tab><tab>", -- Toggle bookmarks(global keymap)
    add = "mm", -- Add bookmarks(global keymap)
    jump = "<space>", -- Jump from bookmarks(buf keymap)
    delete = "mD", -- Delete bookmarks(buf keymap)
    order = "mo", -- Order bookmarks by frequency or updated_time(buf keymap)
    delete_on_virt = "md", -- Delete bookmark at virt text line(global keymap)
    show_desc = "msd", -- show bookmark desc(global keymap)
    toogle_focus = "<S-Tab>", -- toggle window focus (tags-window <-> bookmarks-window)
  },
  width = 0.8, -- Bookmarks window width:  (0, 1]
  height = 0.7, -- Bookmarks window height: (0, 1]
  preview_ratio = 0.45, -- Bookmarks preview window ratio (0, 1]
  tags_ratio = 0.1, -- Bookmarks tags window ratio
  fix_enable = false, -- If true, when saving the current file, if the bookmark line number of the current file changes, try to fix it.

  virt_text = "", -- Show virt text at the end of bookmarked lines, if it is empty, use the description of bookmarks instead.
  sign_icon = "󰃃", -- if it is not empty, show icon in signColumn.
  virt_pattern = { "*.go", "*.lua", "*.sh", "*.php", "*.rs" }, -- Show virt text only on matched pattern
  virt_ignore_pattern = {}, -- Ignore showing virt text on matched pattern, this works after virt_pattern
  border_style = "single", -- border style: "single", "double", "rounded"
  hl = {
    border = "TelescopeBorder", -- border highlight
    cursorline = "guibg=Gray guifg=White", -- cursorline highlight
  }
})
