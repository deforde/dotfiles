local dap = require("dap")
dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "/home/danielforde/apps/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}
dap.adapters.python = {
  type = "executable";
  command = "/usr/bin/python3";
  args = { "-m", "debugpy.adapter" };
}
dap.configurations.c = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = true,
    setupCommands = {
        {
            text = "-enable-pretty-printing",
            description =  "enable pretty printing",
            ignoreFailures = false,
        },
    },
  },
}
dap.configurations.python = {
  {
    type = "python";
    request = "launch";
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
        return cwd .. "/venv/bin/python"
      elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
        return cwd .. "/.venv/bin/python"
      else
        return "/usr/bin/python3"
      end
    end;
  },
}

