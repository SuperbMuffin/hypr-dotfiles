return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "github/copilot.vim",
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    opts = {
      max_lines = 3,
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    opts = {
      picker = "telescope",
      enable_builtin = true,
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function(_, opts)
      require("octo").setup(opts)
    end,
  },

  {
    "vyfor/cord.nvim",
    build = "cargo build --release",
    lazy = false,
    opts = {
      usercmds = true,
      log_level = vim.log.levels.OFF,
      editor = {
        tooltip = "Neovim",
        icon = nil, -- uses default neovim icon
      },
      display = {
        show_time = true,
        show_repository = true,
      },
      text = {
        file_browser = "Browsing files",
        plugin_manager = "Managing plugins",
        lsp_manager = "Configuring LSP",
        vcs = "Committing changes",
      },
    },
  },

  { import = "plugins.mini-starter" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "c",
        "markdown",
        "markdown_inline",
        "bash",
        "python",
        "json",
        "jsonc",
        "yaml",
        "diff",
        "query",
        "rust",
        "javascript",
        "gitignore",
        "gitcommit",
        "git_config",
        "latex",
      },

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },
    },
  },

  {
    "andyg/leap.nvim",
    url = "https://codeberg.org/andyg/leap.nvim",
    config = function()
      local leap = require "leap"

      vim.keymap.set({ "n", "x", "o" }, "<A-Space>", function()
        leap.leap {}
      end, { desc = "Leap forward" })

      vim.keymap.set({ "n", "x", "o" }, "<A-f>", function()
        leap.leap { backward = true }
      end, { desc = "Leap backward" })
    end,
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      preview = {
        hybrid_modes = {},
      },
    },
  },

  { "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },
}
