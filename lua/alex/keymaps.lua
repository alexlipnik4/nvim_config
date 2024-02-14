-- Function to close all buffers except the current one
local builtin = require('telescope.builtin')
local function closeAllBuffers()
  local buffers = vim.api.nvim_list_bufs()
  for _, buffer in ipairs(buffers) do
    if buffer ~= vim.api.nvim_get_current_buf() then
      vim.api.nvim_buf_delete(buffer, { force = true })
    end
  end
end

-- function to find & replace word under cursor
local function find_and_replace()
  local search = vim.fn.expand("<cword>")
  local replace = vim.fn.input("Replace with: ")
  vim.cmd(":%s/" .. search .. "/" .. replace .. "/g")
end

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

vim.keymap.set('n', '<leader>y', '+y')
vim.keymap.set('n', '<leader>Y', '+yg_')
vim.keymap.set('n', '<leader>yy', '+yy')

vim.keymap.set('n', '<leader>p', '+p')
vim.keymap.set('n', '<leader>P', '+P')

-- toggle file explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFile<CR>zz<CR>")
vim.keymap.set("n", "<leader>et", ":NvimTreeToggle<CR>")

vim.keymap.set('n', '<leader>s', ':w<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '*', '*zz', { desc = 'Search and center screen' })
vim.keymap.set('n', '<leader>E', 'Y%', { remap = true, desc = 'Go to matching pair' })

vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set('n', '<leader>bd', ':bdelete<cr>', { desc = 'delete buffer' })
vim.keymap.set('n', '<leader>bn', ':bnext<cr>', { desc = 'next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<cr>', { desc = 'previous buffer' })
vim.keymap.set('n', '<leader>bD', function() closeAllBuffers() end, { desc = 'close all buffers except the current one' })
vim.keymap.set('n', '<C-S-R>', function() find_and_replace() end, { desc = 'find and replace word under cursor' })

-- Key binding for wrapping the highlighted block with {/* */} with line breaks
vim.api.nvim_set_keymap('v', '<leader>c', ":s!^.*\\zs\\(\\%V\\)\\(.*\\)\\ze.*$!{/* \\2 */}<CR>",
  { noremap = true, silent = true })

vim.keymap.set("i", "<C-i>", "<Cmd>lua vim.lsp.buf.hover()<CR>", {})

-- plugins keymaps

--start page
vim.keymap.set('n', '<leader>A', ':Alpha<cr>')

-- trouble
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- git
vim.keymap.set('n', '<leader>ng', '<cmd>Neogit<CR>', { desc = 'Neogit' })

-- codeium
local opts = { expr = true }
vim.keymap.set('i', '<c-a>', function() return vim.fn['codeium#Accept']() end, opts)
vim.keymap.set('i', '<c-N>', function() return vim.fn['codeium#CycleCompletions'](1) end, opts)
vim.keymap.set('i', '<c-s-b>', function() return vim.fn['codeium#CycleCompletions'](-1) end, opts)
vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, opts)

-- telescope
local config = {
  cwd_only = true,
  hidden = true,
  sort_last = true,
}

vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Find git files' })
vim.keymap.set('n', '<leader>ff', function() builtin.find_files(config) end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>of', builtin.oldfiles, { desc = 'Open oldfiles' })
vim.keymap.set('n', '<leader>bf', builtin.buffers, { desc = 'Open buffers' })

vim.keymap.set('n', '<leader>gp', builtin.lsp_document_symbols, { desc = 'Show document symbols' })
vim.keymap.set('n', '<leader>fw', function()
  builtin.grep_string({ search = vim.fn.input("keyword >> ") })
end, { desc = 'Grep string' })
