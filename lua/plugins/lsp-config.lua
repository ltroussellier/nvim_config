return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      -- Format on save logic
      local on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormat." .. bufnr,
              { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            telemetry = { enable = false },
          },
        },
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Add a dedicated Python formatter
      lspconfig.ruff.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    end
  },

  -- Add null-ls or conform.nvim for additional formatting options
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.black,
          -- You can add other formatters and linters here as well
        },
      })
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
