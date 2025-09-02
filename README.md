# My Neovim Configuration

My personal Neovim setup, configured in Lua and continuously evolving.

## Core Philosophy

-   **Modular:** Configuration is organized within the `lua/ISOTOPE/` directory.
-   **Lua-based:** Leveraging Lua for Neovim configuration.
-   **Plugin Management:** Uses `lazy.vim`).

## Key Features & Plugins

-   **LSP:** Full LSP integration via `nvim-lspconfig`, `mason.nvim` for server management, and `nvim-cmp` for autocompletion.
-   **Fuzzy Finding:** `telescope.nvim` for finding files, buffers, commands, etc.
-   **Syntax & More:** `nvim-treesitter` for enhanced syntax highlighting and text objects.
-   **Git:** Seamless Git integration with `vim-fugitive`.
-   **Theme:** `rose-pine` colorscheme.
-   **Navigation:** `ThePrimeagen/harpoon` for quick mark navigation.
-   **Undo Tree:** `mbbill/undotree` for visualizing undo history.
-   **Custom Floating Terminal:** Persistent floating terminal toggled with `:T` or `<leader>T`.

## Keybindings

A selection of custom mappings defined in `lua/ISOTOPE/remap.lua`, including:
-   System clipboard integration (`<leader>y`).
-   LSP formatting (`<leader>f`).
-   Tmux sessionizer (`<C-f>`).
-   Floating terminal toggle (`<leader>T` in Normal/Terminal mode).
