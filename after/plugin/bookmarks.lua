require('bookmarks').setup {
  -- sign_priority = 8,  --set bookmark sign priority to cover other sign
  save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
  keywords = {
    ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
    ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
    ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
    ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
  },
  on_attach = function()
    local bm = require "bookmarks"
    local map = vim.keymap.set
    map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line map("n","mi",bm.bookmark_ann) -- add or edit mark annotation at current line
    map("n", "mc", function()
      bm.bookmark_clean()
    end
    ) -- clean all marks in local buffer
    map("n", "mn", function()
      bm.bookmark_next()
      vim.cmd("normal! zz")
    end
    ) -- jump to next mark in local buffer
    map("n", "mp", function()
      bm.bookmark_prev()
      vim.cmd("normal! zz")
    end
    )                                               -- jump to previous mark in local buffer
    map("n", "ml", ':Telescope bookmarks list<CR>') -- jump to previous mark in local buffer
  end
}

require('telescope').load_extension('bookmarks')

--vim.keymap.set('n', '<leader>ml', ':Telescope bookmarks list<CR>')
