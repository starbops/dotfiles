return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    opts = require "configs.lspconfig",
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
