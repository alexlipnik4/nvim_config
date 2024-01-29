local memento = require("memento")

vim.keymap.set('n', '<leader>ht', ':lua require("memento").toggle()<CR>')
vim.keymap.set('n', '<leader>hc', ':lua require("memento").clear_history()<CR>')
