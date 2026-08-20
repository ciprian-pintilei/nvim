return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                exclude = { "**/.venv/**", "**/venv/**", "**/site-packages/**", "**/dist/**" },
                diagnosticSeverityOverrides = {
                  reportUnannotatedClassAttribute = "none",
                  reportUnusedCallResult = "none",
                },
              },
            },
          },
        },
      },
    },
  },
}