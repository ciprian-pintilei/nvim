return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- Neovim 0.12 ships a built-in scheme named `catppuccin`.
      -- Use the plugin's unambiguous alias so lazy.nvim loads catppuccin/nvim.
      colorscheme = "catppuccin-nvim",
    },
  },
}
