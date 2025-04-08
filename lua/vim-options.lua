vim.opt.tabstop = 2      -- number of spaces for a tab
vim.opt.shiftwidth = 2   -- number of spaces for auto-indent
vim.opt.expandtab = true -- convert tabs to spaces


vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
-- vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.wo.number = true
vim.o.completeopt = 'menuone,noselect'
vim.keymap.set({ "n", "x", "i" }, "<C-s>", "<cmd>write<CR>")
vim.opt.linebreak = true
vim.opt.laststatus = 3
vim.opt.clipboard = "unnamedplus"

-- Custom scroll amount (e.g., x lines)
vim.keymap.set('n', '<C-f>', '12j', { noremap = true }) -- x lines down
vim.keymap.set('n', '<C-b>', '12k', { noremap = true }) -- x lines up

vim.keymap.set("n", "<leader>i", function()
  vim.lsp.buf.format({ async = true, name = "null-ls" })
end, { desc = "Format with null-ls" })
