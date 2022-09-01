require"dap-python".setup("~/.virtualenvs/debugpy/bin/python")
require"dap-python".test_runner = "pytest"
table.insert(require("dap").configurations.python, {
  type = "python",
  request = "launch",
  name = "All code",
  program = "${file}",
  justMyCode = false,
})
