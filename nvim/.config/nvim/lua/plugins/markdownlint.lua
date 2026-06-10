return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    opts.linters = opts.linters or {}
    opts.linters["markdownlint-cli2"] = {
      prepend_args = {
        "--config",
        vim.fn.expand("~/.config/markdownlint/.markdownlint.jsonc"),
      },
    }
  end,
}
