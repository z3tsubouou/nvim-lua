return {
  -- add gruvbox
  { "rebelot/kanagawa.nvim" },

  -- {
  --   "craftzdog/solarized-osaka.nvim",
  --   branch = "osaka",
  --   lazy = true,
  --   priority = 1000,
  --   opts = function()
  --     return {
  --       transparent = false,
  --     }
  --   end,
  -- },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
