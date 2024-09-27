local options = {
  formatters_by_ft = {
    bash = { "beautysh" },
    css = { "prettier" },
    go = { "gofmt", "goimports" },
    html = { "prettier" },
    java = { "google-java-format" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    json = { "prettierd", "prettier", stop_after_first = true },
    lua = { "stylua" },
    markdown = { "prettierd", "prettier", stop_after_first = true },
    python = { "isort", "black" },
    ruby = { "standardrb" },
    yaml = { "yamlfix" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
