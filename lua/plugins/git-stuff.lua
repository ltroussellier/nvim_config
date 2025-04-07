return {
  -- Load plenary first
  { "nvim-lua/plenary.nvim", lazy = false },

  -- Then diffview with explicit setup before neogit
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- Make sure diffview is fully initialized before neogit uses it
      local diffview = require("diffview")
      diffview.setup({
        enhanced_diff_hl = true,
        view = {
          default = {
            layout = "diff2_horizontal",
          },
        },
      })
      vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", {})
      vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>", {})
    end,
    lazy = false, -- Force this to load early
  },

  -- Then neogit with careful integration setup
  {
    "TimUntersberger/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function()
      -- Add a small delay to ensure diffview is fully loaded
      vim.defer_fn(function()
        require("neogit").setup({
          integrations = {
            diffview = true,
          },
          -- Disable auto diff to see if that helps
          disable_context_highlighting = false,
          disable_signs = false,
          disable_hint = false,
          disable_commit_confirmation = false,
        })
      end, 10)
      vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", {})
    end,
  },

  -- Gitsigns (unchanged)
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      local gs = require("gitsigns")
      vim.keymap.set("n", "<leader>gp", gs.preview_hunk, {})
      vim.keymap.set("n", "<leader>gt", gs.toggle_current_line_blame, {})
      vim.keymap.set("n", "]h", gs.next_hunk)
      vim.keymap.set("n", "[h", gs.prev_hunk)
      vim.keymap.set("n", "<leader>gs", gs.stage_hunk)
      vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk)
      vim.keymap.set("n", "<leader>gr", gs.reset_hunk)
      vim.keymap.set("n", "<leader>gl", gs.blame_line)
    end,
  },
}
