-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "nord",
  theme_toggle = { "vscode_dark", "flex-light" },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- M.mason = {
--   cmd = true,
--   pkgs = {
--     "ansible-language-server",
--     "bash-language-server",
--     "css-lsp",
--     "gopls",
--     "html-lsp",
--     "jdtls",
--     "lua-language-server",
--     "stylua",
--     "terraform-ls",
--   }
-- }

return M
