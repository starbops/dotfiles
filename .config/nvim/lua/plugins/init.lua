return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "bashls",
        "clangd",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "gopls",
        "html",
        "jdtls",
        "jsonls",
        "lua_ls",
        "marksman",
        "pylsp",
        "ruby_lsp",
        "terraformls",
        "texlab",
        "yamlls",
      }
    }
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "beancount",
        "cpp",
        "css",
        "csv",
        "dockerfile",
        "git_config",
        "git_rebase",
        "go",
        "html",
        "java",
        "javascript",
        "json",
        "latex",
        "lua",
        "make",
        "markdown",
        "nix",
        "passwd",
        "php",
        "python",
        "ruby",
        "rust",
        "terraform",
        "vim",
        "vimdoc",
        "yaml",
      },
      indent = {
        disable = { "yaml" },
      },
    },
  },
}
