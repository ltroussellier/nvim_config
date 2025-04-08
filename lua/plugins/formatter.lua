return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>i",
      function()
        require("conform").format({ async = true })
      end,
      desc = "Format document",
    },
  },
  opts = {
    formatters_by_ft = {
      python = { "isort", "black" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
