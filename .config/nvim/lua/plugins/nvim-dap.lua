local dap = require("dap")

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "/home/danielforde/dev/3rdparty/cppdbg/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7",
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

dap.adapters.python = {
  type = "executable";
  command = "/usr/bin/python3";
  args = { "-m", "debugpy.adapter" };
}
dap.configurations.python = {
  {
    name = "Launch file";
    type = "python";
    request = "launch";
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

