require("alex.sets")
require("alex.lazy")
require("alex.keymaps")
require("alex.md_preview")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local FormatOptions = augroup("FormatOptions", { clear = true })
autocmd("BufEnter", {
  group = FormatOptions,
  pattern = "*",
  desc = "Set buffer local formatoptions.",
  callback = function()
    vim.cmd(":colorscheme codedark")
  end,
})
