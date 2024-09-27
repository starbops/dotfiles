require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local opt = vim.opt

opt.cursorlineopt = "both"

opt.tabstop = 8
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

opt.list = true
opt.listchars = {
  tab = "» ",
  lead = "•",
  trail = "•",
}

