return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      vim.fn.sign_define("DapBreakpoint",{ text = "🟥", texthl = "", linehl = "", numhl = ""})
      vim.fn.sign_define("DapStopped",{ text = "▶️", texthl = "", linehl = "", numhl = ""})
    end,
    keys = {
      { "<F5>", '<cmd>lua require("dap").continue()<CR>', mode = "n", desc = "DAP continue" },
      { "<S-F5>", '<cmd>lua require("dap").terminate()<CR>', mode = "n", desc = "DAP terminate" },
      { "<F9>", '<cmd>lua require("dap").toggle_breakpoint()<CR>', mode = "n", desc = "DAP toggle breakpoint" },
      { "<F10>", '<cmd>lua require("dap").step_over()<CR>', mode = "n", desc = "DAP step over" },
      { "<F11>", '<cmd>lua require("dap").step_into()<CR>', mode = "n", desc = "DAP step into" },
      { "<S-F11>", '<cmd>lua require("dap").step_out()<CR>', mode = "n", desc = "DAP step out" },
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      dapui.setup()

      -- dap.listeners.after.event_initialized.dapui_config = function()
      dap.listeners.after.initialize.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapup_config = function()
        dapui.close()
      end
    end,
    keys = {
      { "<leader>dq", '<cmd>lua require("dapui").close()<CR>', mode = "n", desc = "DAP UI close" },
    }
  },

  {
    "leoluz/nvim-dap-go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    ft = "go",
    opts = {},
    keys = {
      { "<leader>dt", '<cmd>lua require("dap-go").debug_test()<CR>', mode = "n", desc = "DAP Go debug test" },
      { "<leader>dl", '<cmd>lua require("dap-go").debug_last_test()<CR>', mode = "n", desc = "DAP Go debug last test" },
    },
  },
}
