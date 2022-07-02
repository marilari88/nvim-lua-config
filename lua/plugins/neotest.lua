require("neotest").setup({
  output = {
    enabled = "true",
    open_on_run = "short"
  },
  adapters = {
    require("neotest-jest")
  },
})
