local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local fb_actions = require "telescope".extensions.file_browser.actions

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

require("telescope").setup {
  defaults = {
    file_ignore_patterns = { "node_modules", "build", "dist", ".git/", "charting_library", "datafeeds",
      "charting_library", "datafeeds" },
    mappings = {
      n = {
        ["q"] = actions.close
      }
    }
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
    live_grep = {
      theme = "ivy",
    },
    buffers = {
      theme = "ivy"
    },
    help_tags = {
      theme = "ivy"
    },
    diagnostics = {
      theme = "ivy"
    },
    command_history = {
      theme = "ivy"
    },
    keymaps = {
      theme = "ivy"
    },
    treesitter = {
      theme = "ivy"
    },
    resume = {
      theme = "ivy"
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
    },
    package_info = {
      theme = "ivy",
    },
    file_browser = {
      hidden = true,
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function()
            vim.cmd('normal vbd')
          end
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["R"] = fb_actions.rename,
          ["M"] = fb_actions.move,
          ["N"] = fb_actions.create,
          ["D"] = fb_actions.remove,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        }
      }
    }
  }
}

require("telescope").load_extension("file_browser")
require('telescope').load_extension('fzf')
require("telescope").load_extension("package_info")

vim.keymap.set('n', ';p', builtin.find_files, {})
vim.keymap.set('n', ';f', builtin.live_grep, {})
vim.keymap.set('n', ';b', builtin.buffers, {})
vim.keymap.set('n', ';h', builtin.help_tags, {})
vim.keymap.set('n', ';d', builtin.diagnostics, {})
vim.keymap.set('n', ';ch', builtin.command_history, {})
vim.keymap.set('n', ';km', builtin.keymaps, {})
vim.keymap.set('n', ';ts', builtin.treesitter, {})
vim.keymap.set('n', ';;', builtin.resume, {})

vim.keymap.set("n", ";e", function()
  require("telescope").extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    -- previewer = false,
    initial_mode = "normal",
    -- layout_config = {
    --   height = 40
    -- }
  })
end)
