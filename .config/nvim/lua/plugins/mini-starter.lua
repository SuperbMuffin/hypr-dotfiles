-- Start screen for plain `nvim` (no file).
return {
  {
    "ahmedkhalf/project.nvim",
    event = "VimEnter",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern" },
        patterns = { ".git", "Makefile", "package.json", "Cargo.toml" },
      })
      pcall(require("telescope").load_extension, "projects")
      local ext = require("telescope").extensions.projects
      if ext and ext.projects then
        ext.projects = function(opts)
          require("configs.telescope-projects").open(opts)
        end
      end
    end,
  },

  {
    "nvim-mini/mini.starter",
    version = false,
    event = "VimEnter",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
    },
    opts = function()
      local pad = string.rep(" ", 12)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end
      local starter = require "mini.starter"

      local logo = table.concat({
        " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      }, "\n")

      return {
        evaluate_single = true,
        header = logo,
        items = {
          {
            name = "Projects",
            section = pad .. "Telescope",
            action = function()
              require("configs.telescope-projects").open()
            end,
          },
          new_section("Find file", "Telescope find_files", "Telescope"),
          new_section("New file", "ene | startinsert", "Builtin"),
          new_section("Quit", "qa", "Builtin"),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
    end,
    config = function(_, opts)
      local starter = require "mini.starter"

      local lazy_was_open = vim.o.filetype == "lazy"
      if lazy_was_open then
        vim.cmd.close()
      end

      starter.setup(opts)

      -- Heavier type reads larger in the terminal without adding blank lines or huge padding.
      local function bold_menu()
        for _, hlname in ipairs({
          "MiniStarterItem",
          "MiniStarterItemPrefix",
          "MiniStarterSection",
          "MiniStarterItemBullet",
        }) do
          local ok, def = pcall(vim.api.nvim_get_hl, 0, { name = hlname, link = true })
          if ok and def and next(def) ~= nil then
            def.bold = true
            def.default = nil
            pcall(vim.api.nvim_set_hl, 0, hlname, def)
          end
        end
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniStarterOpened",
        callback = function()
          if lazy_was_open then
            require("lazy").show()
          end
          vim.schedule(bold_menu)
        end,
      })

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          if vim.bo.filetype == "ministarter" then
            vim.schedule(bold_menu)
          end
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyDone",
        once = true,
        callback = function()
          local ok, lazy = pcall(require, "lazy")
          if not ok then
            return
          end
          local stats = lazy.stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local pad_footer = string.rep(" ", 8)
          starter.config.footer = pad_footer .. "Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          if vim.bo.filetype == "ministarter" then
            pcall(starter.refresh)
          end
        end,
      })
    end,
  },
}
