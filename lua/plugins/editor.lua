return {
  {
    "telescope.nvim",
    lazy = true,
    event = "VimEnter",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      { "<leader><space>", nil },
      { "<leader>,", nil },
      { "<leader>:", nil },
      { "<leader>/", nil },
      { "<leader>fo", nil },
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fp",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
        desc = "Lists files in your current working directory, respects .gitignore",
      },
      {
        "<leader>ff",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
      },
      {
        "<leader>f\\",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "Lists open buffers",
      },
      {
        "<leader>ft",
        function()
          local builtin = require("telescope.builtin")
          builtin.help_tags()
        end,
        desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
      },
      {
        "<leader>f;",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        desc = "Resume the previous telescope picker",
      },
      {
        "<leader>fd",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer",
      },
      {
        "<leader>fs",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = "Lists Function names, variables, from Treesitter",
      },
      {
        "<leader>fb",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = true,
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        file_ignore_patterns = {
          "node_modules",
          "build",
          "dist",
          ".git/",
          "charting_library",
          "datafeeds",
          "charting_library",
          "datafeeds",
          "target",
        },
        initial_mode = "normal",
        wrap_results = true,
        include_declaration = false,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          i = {
            ["<c-t>"] = function(bufnr)
              actions.select_tab(bufnr)
            end,
            ["<C-t>"] = function(bufnr)
              actions.select_tab(bufnr)
            end,
          },
          n = {
            ["<c-t>"] = function(bufnr)
              actions.select_tab(bufnr)
            end,
            ["<C-t>"] = function(bufnr)
              actions.select_tab(bufnr)
            end,
          },
        },
      })
      opts.pickers = {
        diagnostics = {
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }
      opts.extensions = {
        file_browser = {
          hidden = true,
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          previewer = true,
          respect_gitignore = false,
          grouped = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ["R"] = fb_actions.rename,
              ["M"] = fb_actions.move,
              ["N"] = fb_actions.create,
              ["D"] = fb_actions.remove,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<C-t>"] = function(bufnr)
                actions.select_tab(bufnr)
              end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
    end,
  },
  -- {
  --   { "LintaoAmons/cd-project.nvim" },
  -- },
  -- lazy.nvim
  {
    "ThePrimeagen/harpoon",
    lazy = true,
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          "<leader>hH",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>hh",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
        {
          "<leader>hn",
          function()
            require("harpoon"):list():next()
          end,
          desc = "Harpoon next",
        },
        {
          "<leader>hp",
          function()
            require("harpoon"):list():prev()
          end,
          desc = "Harpoon prev",
        },
        {
          "<leader>hdd",
          function()
            require("harpoon"):list():remove()
          end,
          desc = "Harpoon delete",
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          "<leader>h" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
        table.insert(keys, {
          "<leader>hd" .. i,
          function()
            require("harpoon"):list():remove_at(i)
          end,
          desc = "Harpoon delete file " .. i,
        })
      end
      return keys
    end,
  },
}
