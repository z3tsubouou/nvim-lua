return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "prettier",
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "goimports",
        "gofumpt",
      })
    end,
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          enabled = false,
        },
        ts_ls = {
          enabled = true,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "literals",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },
          },
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    ---@diagnostic disable-next-line: assign-type-mismatch
                    only = { "source.organizeImports.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
            {
              "<leader>cR",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    ---@diagnostic disable-next-line: assign-type-mismatch
                    only = { "source.removeUnused.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Remove Unused Imports",
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://json.schemastore.org/kustomization.json"] = "kustomization.{yml,yaml}",
                ["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] = "docker-compose*.{yml,yaml}",
                ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] = "argocd-application.yaml",
              },
            },
          },
        },
        eslint = {
          settings = {
            packageManager = "yarn",
          },
          on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end,
        },
        svelte = {
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
          capabilities = {
            workspace = {
              didChangeWatchedFiles = vim.fn.has("nvim-0.10") == 0 and { dynamicRegistration = true },
            },
          },
        },
        taplo = {
          keys = {
            {
              "K",
              function()
                if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                  require("crates").show_popup()
                else
                  vim.lsp.buf.hover()
                end
              end,
              desc = "Show Crate Documentation",
            },
          },
        },
      },
      setup = {
        rust_analyzer = function()
          return true
        end,
        ts_ls = function()
          return false
        end,
        vtsls = function()
          return true
        end,
      },
    },
  },
}
