return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>r',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[R]eformat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Run ruff's autofix + import sort, then ruff's formatter last.
      -- These run sequentially (list = sequential in conform).
      python = { 'ruff_fix', 'ruff_organize_imports', 'ruff_format' },
      javascript = { 'prettier' },
      json = { 'prettier' },
      markdown = { 'markdownlint-cli2' },
    },
  },
}
