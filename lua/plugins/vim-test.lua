return {
  "vim-test/vim-test",
  config = function()
    vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", {})
    vim.keymap.set("n", "<leader>T", ":TestFile<CR>", {})
    vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", {})
    vim.keymap.set("n", "<leader>l", ":TestLast<CR>", {})
    vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", {})
    vim.cmd("let test#strategy = 'neovim'")
    -- Configure pytest to use uv run
    vim.cmd("let test#python#pytest#executable = 'uv run pytest'")
  end,
}
