# nvim

Neovim config based on [LazyVim](https://github.com/LazyVim/LazyVim).

## Extras enabled

- `lang.python` — basedpyright, ruff LSP, venv-selector
- `lang.typescript` — vtsls
- `formatting.prettier` — JS/TS/JSON/CSS
- `editor.neo-tree` — file explorer
- `dap.core` — nvim-dap + dap-ui (if DAP enabled)

## Customizations

- **Python**: basedpyright with workspace diagnostics, autoSearchPaths, `.venv`/`site-packages` excluded from analysis
- **Python formatting**: ruff (fix → organize imports → format) via conform
- **Formatting**: stylua (Lua, built-in), ruff (Python), prettier (JS/TS/JSON via extras)
- **Theme**: catppuccin, with Omarchy hot-reload support
- **Omarchy**: remote clipboard sync for SSH sessions, transparency
- **UI**: Snacks animations disabled, news alerts suppressed