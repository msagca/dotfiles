return {
  'mfussenegger/nvim-dap',
  dependencies = { 'nvim-neotest/nvim-nio', 'rcarriga/nvim-dap-ui' },
  event = 'BufRead',
  config = function()
    local program = function() return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file') end
    local gdb = vim.fn.exepath 'gdb'
    local dap = require 'dap'
    if gdb ~= '' then
      dap.adapters.cppdbg = { command = gdb, args = { '-i', 'dap' }, type = 'executable' }
      dap.adapters.gdb = { command = gdb, args = { '-i', 'dap' }, type = 'executable' }
      dap.configurations.c = { { name = 'Launch C', cwd = '${workspaceFolder}', program = program, request = 'launch', type = 'gdb' } }
      dap.configurations.cpp = { { name = 'Launch C++', cwd = '${workspaceFolder}', program = program, request = 'launch', type = 'cppdbg' } }
    end
    local dapui = require 'dapui'
    dapui.setup()
    dap.listeners.after.disconnect.dapui_config = function() dapui.close() end
    dap.listeners.after.event_exited.dapui_config = function() dapui.close() end
    dap.listeners.after.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.after.terminate.dapui_config = function() dapui.close() end
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    local widgets = require 'dap.ui.widgets'
    vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = 'Step over' })
    vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = 'Step into' })
    vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = 'Step out' })
    vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = 'Continue' })
    vim.keymap.set('n', '<F9>', function() dap.step_back() end, { desc = 'Step back' })
    vim.keymap.set('n', '<leader>B', function() dap.set_breakpoint() end, { desc = 'Set breakpoint' })
    vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end, { desc = 'Toggle breakpoint' })
    vim.keymap.set('n', '<leader>c', function() dap.clear_breakpoints() end, { desc = 'Clear breakpoints' })
    vim.keymap.set('n', '<leader>d', function() dap.disconnect() end, { desc = 'Disconnect' })
    vim.keymap.set('n', '<leader>e', function() dapui.eval(nil, { enter = true }) end, { desc = 'Evaluate' })
    vim.keymap.set('n', '<leader>f', function() widgets.centered_float(widgets.frames) end, { desc = 'Frames' })
    vim.keymap.set('n', '<leader>l', function() dap.list_breakpoints() end, { desc = 'List breakpoints' })
    vim.keymap.set('n', '<leader>r', function() dap.restart() end, { desc = 'Restart' })
    vim.keymap.set('n', '<leader>s', function() widgets.centered_float(widgets.scopes) end, { desc = 'Scopes' })
    vim.keymap.set('n', '<leader>t', function() dap.terminate() end, { desc = 'Terminate' })
    vim.keymap.set({ 'n', 'v' }, '<leader>h', function() widgets.hover() end, { desc = 'Hover' })
    vim.keymap.set({ 'n', 'v' }, '<leader>p', function() widgets.preview() end, { desc = 'Preview' })
  end,
}
