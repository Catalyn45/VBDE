local dap = require('dap')

dap.adapters.cpp = {
    type = 'executable',
    command = 'lldb-vscode',
    env = {
      LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
    },
    name = "lldb"
}

dap.configurations.cpp = {
    {
      name = "Launch",
      type = "cpp",
      request = "launch",
      cwd = '${workspaceFolder}',
    }
}

dap.configurations.c = dap.configurations.cpp

require('dap-python').setup()
table.insert(require('dap').configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'My custom launch configuration',
  program = '${file}',
})

local config_paths = {"./.nvim-dap/nvim-dap.lua", "./.nvim-dap.lua", "./.nvim/nvim-dap.lua"}

local project_config = ""
for _, p in ipairs(config_paths) do
    local f = io.open(p)
    if f ~= nil then
        f:close()
        project_config = p
        break
    end
end

if project_config ~= "" then
    vim.cmd(":luafile " .. project_config)
end

local dapui = require('dapui')

local config = {
    controls = {
      element = "repl",
      enabled = true,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = ""
      }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = "single",
      mappings = {
        close = { "q", "<Esc>" }
      }
    },
    force_buffers = true,
    icons = {
      collapsed = "",
      current_frame = "",
      expanded = ""
    },
    layouts = { {
        elements = { {
            id = "scopes",
            size = 0.25
          }, {
            id = "breakpoints",
            size = 0.25
          }, {
            id = "stacks",
            size = 0.25
          }, {
            id = "watches",
            size = 0.25
          } },
        position = "left",
        size = 40
      }, {
        elements = { {
            id = "repl",
            size = 0.5
          }, {
            id = "console",
            size = 0.5
          } },
        position = "bottom",
        size = 10
      } },
    mappings = {
      edit = "e",
      expand = { "<CR>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t"
    },
    render = {
      indent = 1,
      max_value_lines = 100
    }
  }

dapui.setup(config)

require('nvim-dap-virtual-text').setup()

