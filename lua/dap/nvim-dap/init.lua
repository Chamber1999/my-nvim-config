local dap = require('dap')
local dapui = require("dapui")
require("nvim-dap-virtual-text").setup({
  commented = true,
})

-- 定义各种图标

vim.fn.sign_define("DapBreakpoint", {
  text = "🛑",
  texthl = "LspDiagnosticsSignError",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapStopped", {
  text = "",
  texthl = "LspDiagnosticsSignInformation",
  linehl = "DiagnosticUnderlineInfo",
  numhl = "LspDiagnosticsSignInformation",
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "",
  texthl = "LspDiagnosticsSignHint",
  linehl = "",
  numhl = "",
})

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "o", "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  },
}) -- use default
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Toggle breakpoint
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>lua require("dap").toggle_breakpoint()<CR>', { noremap = true, silent = true })
-- Start debugging
vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua require("dap").continue()<CR>', { noremap = true, silent = true })
-- Stop debugging
vim.api.nvim_set_keymap('n', '<leader>dq', '<cmd>lua require("dap").disconnect(); require("dap").close()<CR>', { noremap = true, silent = true })
-- Step over
vim.api.nvim_set_keymap('n', '<F9>', '<cmd>lua require("dap").step_over()<CR>', { noremap = true, silent = true })
-- Step into
vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua require("dap").step_into()<CR>', { noremap = true, silent = true })
-- Step out
vim.api.nvim_set_keymap('n', '<F11>', '<cmd>lua require("dap").step_out()<CR>', { noremap = true, silent = true })
-- 配置nvim-dap
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/lei/.local/share/nvim/site/pack/packer/start/vimspector/gadgets/linux/vscode-cpptools/debugAdapters/bin/OpenDebugAD7',
}
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    },
    {
        name = 'Attach to gdbserver :1234',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
    },
}
