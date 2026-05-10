return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', 
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
   			"vim", "lua", "vimdoc",
        "html", "css", "c", "markdown", "markdown_inline",
        "bash", "python", "json", "jsonc", "yaml", "diff",
        "query", "rust", "javascript", "gitignore", "gitcommit",
        "git_config"
   		},
   	},
  },

  -- image.nvim
  {
    "3rd/image.nvim",
    build = false, 
    rocks = { enabled = false},
    lazy = false,
    opts = {
        processor = "magick_cli",
        backend = "kitty",
        integrations = {
            markdown = {
                enabled = true,
                download_remote_images = true,
                filetypes = { "markdown", "vimwiki" },
            },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = math.huge,
        max_height_window_percentage = 50,
        hijack_file_patterns = {
            "*.png", "*.jpg", "*.jpeg",
            "*.gif", "*.webp", "*.svg",
        },
    },
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
  },
}
