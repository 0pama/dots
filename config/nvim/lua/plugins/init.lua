return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },


{
  "Hashino/doing.nvim",
  lazy = false, -- so keys are available immediately
  config = function()
    local doing = require("doing")

    doing.setup {
      message_timeout = 2000,
      doing_prefix = "Doing: ",
      ignored_buffers = { "NvimTree" },
      show_remaining = true,
      show_messages = true,
      edit_win_config = { width = 50, height = 15, border = "rounded" },
      winbar = { enabled = true },
      store = { file_name = ".tasks", sync_tasks = false },
    }

    vim.api.nvim_set_hl(0, "WinBar", { link = "Search" })

    vim.keymap.set("n", "<leader>da", doing.add, { desc = "[D]oing: [A]dd" })
    vim.keymap.set("n", "<leader>de", doing.edit, { desc = "[D]oing: [E]dit" })
    vim.keymap.set("n", "<leader>dn", doing.done, { desc = "[D]oing: Do[n]e" })
    vim.keymap.set("n", "<leader>dt", doing.toggle, { desc = "[D]oing: [T]oggle" })
    vim.keymap.set("n", "<leader>ds", function()
      vim.notify(doing.status(true), vim.log.levels.INFO, { title = "Doing:", icon = "" })
    end, { desc = "[D]oing: [S]tatus" })
  end,
},

  {
    "ThePrimeagen/vim-be-good",
    lazy = false,
    cmd  ='VimBeGood',
  }
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
