function SetColorscheme(color)
  --color = color or "tokyonight-night"
  --color = color or "rose-pine"
  --color = color or "moonlight"
  --color = color or "nightfly"
  --color = color or "night-owl"
  color = color or "dracula"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
end

SetColorscheme()


vim.keymap.set("n", "<leader>th", require('telescope.builtin').colorscheme, { desc = "Select Colorscheme" })
