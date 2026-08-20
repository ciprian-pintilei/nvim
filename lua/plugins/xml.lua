-- XML formatting + validation (covers .config, .csproj, .xml, etc.)
--
-- Requirements (already present on this machine):
--   * tidy    -> formatting        (brew install tidy-html5)
--   * xmllint -> validation         (ships with macOS / libxml2)

-- Make sure *.config (.NET App.config / Web.config) is always treated as XML,
-- even when it lacks an <?xml ...?> declaration for content detection.
vim.filetype.add({
  extension = { config = "xml" },
})

return {
  -- 1) Formatting via conform.nvim using `tidy`
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        -- tidy reads from stdin and writes reindented XML to stdout
        tidy_xml = {
          command = "tidy",
          args = {
            "-xml", -- treat input as XML
            "-indent", -- pretty-print with indentation
            "-quiet", -- no version banner
            "--indent-spaces", "4", -- match your tab-ish style
            "--wrap", "0", -- never hard-wrap long lines
            "-", -- read stdin
          },
          -- tidy exits 1 on warnings; those still produce valid output
          exit_codes = { 0, 1 },
          stdin = true,
        },
      },
      formatters_by_ft = {
        xml = { "tidy_xml" },
      },
    },
  },

  -- 2) Validation via nvim-lint using `xmllint`
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        xml = { "xmllint" },
      },
      linters = {
        xmllint = {
          cmd = "xmllint",
          stdin = true,
          args = { "--noout", "-" },
          stream = "stderr",
          ignore_exitcode = true,
          -- xmllint errors look like:  -:12: parser error : <message>
          parser = require("lint.parser").from_pattern(
            "^-:(%d+):%s*.-:%s*(.+)$",
            { "lnum", "message" },
            nil,
            { source = "xmllint", severity = vim.diagnostic.severity.ERROR }
          ),
        },
      },
    },
  },
}
