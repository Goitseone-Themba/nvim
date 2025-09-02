-- lua/lazy.lua
theme = require("ISOTOPE.theme")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Themes
    theme[1],
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            vim.cmd("colorscheme catppuccin")
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            vim.cmd("colorscheme gruvbox")
        end,
    },



    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "nvim-treesitter/playground",

    -- Utils
    "ThePrimeagen/harpoon",
    "mbbill/undotree",
    "wakatime/vim-wakatime",
    "tpope/vim-fugitive",
    "ThePrimeagen/vim-be-good",

    -- LSP + Mason + Completion
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "saadparwaiz1/cmp_luasnip",

            { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
        },
    },
})
