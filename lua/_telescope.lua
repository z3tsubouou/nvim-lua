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
    resume = {
      theme = "ivy"
    },
  },
  extensions = {
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

vim.keymap.set('n', ';p', builtin.find_files, {})
vim.keymap.set('n', ';f', builtin.live_grep, {})
vim.keymap.set('n', ';b', builtin.buffers, {})
vim.keymap.set('n', ';h', builtin.help_tags, {})
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
