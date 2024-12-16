return {
  -- Create annotations with one keybind, and jump your cursor in the inserted annotation
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    opts = {
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--glob=!node_modules",
        },
        pattern = [[\b(KEYWORDS):]],
      },
    },
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "hrsh7th/cmp-emoji",
  --   },
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     local cmp = require("cmp")
  --
  --     local defaults = require("cmp.config.default")()
  --
  --     opts.window = {
  --       completion = cmp.config.window.bordered(),
  --       documentation = cmp.config.window.bordered(),
  --     }
  --
  --     opts.completion = {
  --       completeopt = "menu,menuone,noinsert",
  --     }
  --
  --     opts.snippet = {
  --       expand = function(args)
  --         require("luasnip").lsp_expand(args.body)
  --       end,
  --     }
  --
  --     opts.formatting = {
  --       format = function(_, item)
  --         local icons = require("lazyvim.config").icons.kinds
  --         if icons[item.kind] then
  --           item.kind = icons[item.kind] .. item.kind
  --         end
  --         return item
  --       end,
  --     }
  --
  --     opts.mapping = cmp.mapping.preset.insert({
  --       ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
  --       ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  --       ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --       ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --       ["<C-c>"] = cmp.mapping.complete(),
  --       ["<C-e>"] = cmp.mapping.abort(),
  --       ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --       ["<S-CR>"] = cmp.mapping.confirm({
  --         behavior = cmp.ConfirmBehavior.Replace,
  --         select = true,
  --       }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --       ["<C-CR>"] = function(fallback)
  --         cmp.abort()
  --         fallback()
  --       end,
  --       ["<Tab>"] = cmp.mapping(function(fallback)
  --         local col = vim.fn.col(".") - 1
  --
  --         if cmp.visible() then
  --           cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
  --         elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
  --           fallback()
  --         else
  --           cmp.complete()
  --         end
  --       end, { "i", "s" }),
  --
  --       ["<S-Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --     })
  --
  --     table.insert(opts.sources, { name = "buffer" })
  --     table.insert(opts.sources, { name = "emoji" })
  --
  --     opts.sorting = defaults.sorting
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   event = "VeryLazy",
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  --   event = "VeryLazy",
  --   config = function()
  --     require("copilot").setup({
  --       panel = {
  --         enabled = false,
  --         auto_refresh = false,
  --         keymap = {
  --           jump_prev = "<M-[>",
  --           jump_next = "<M-]>",
  --           accept = "<CR>",
  --           refresh = "<M-r>",
  --           open = "<M-l>",
  --         },
  --         layout = {
  --           position = "bottom", -- | top | left | right
  --           ratio = 0.4,
  --         },
  --       },
  --       suggestion = {
  --         enabled = true,
  --         auto_trigger = true,
  --         debounce = 75,
  --         keymap = {
  --           -- accept = "<M-l>",
  --           accept = "<M-CR>",
  --           accept_word = "<M-w>",
  --           accept_line = "<M-l>",
  --           next = "<M-]>",
  --           prev = "<M-[>",
  --           dismiss = "<M-d>",
  --         },
  --       },
  --       filetypes = {
  --         markdown = true,
  --         yaml = true,
  --         typescript = true,
  --         javascript = true,
  --         javascriptreact = true,
  --         typescriptreact = true,
  --         svelte = true,
  --         vue = true,
  --         html = true,
  --         css = true,
  --         scss = true,
  --         json = true,
  --         graphql = true,
  --         php = true,
  --         python = true,
  --         rust = true,
  --         toml = true,
  --         go = true,
  --         java = true,
  --         kotlin = true,
  --         lua = true,
  --         ruby = true,
  --         elixir = true,
  --         erlang = true,
  --         shell = true,
  --         fish = true,
  --         zsh = true,
  --         bash = true,
  --         ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
  --       },
  --       copilot_node_command = "node", -- Node.js version must be > 18.x
  --       server_opts_overrides = {},
  --     })
  --   end,
  -- },
  -- {
  --   "m4xshen/hardtime.nvim",
  --   event = "VeryLazy",
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --   opts = {},
  -- },
}
