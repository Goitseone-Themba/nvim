-- lua/lazy.lua
theme = require("ISOTOPE.theme")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
        branch = "master",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        'sudormrfbin/cheatsheet.nvim',

        dependencies = {
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        }
    },

    -- Themes
    theme[1],
    {
        "rose-pine/neovim",
    },
    {
        "catppuccin/nvim",
    },
    {
        "ellisonleao/gruvbox.nvim",
    },
    {
        "bjarneo/ethereal.nvim",
    },
    {
        "neanias/everforest-nvim",
    },
    {
        "kepano/flexoki-neovim",
    },
    {
        "rebelot/kanagawa.nvim",
    },
    {
        "tahayvr/matteblack.nvim",
    },
    {
        "EdenEast/nightfox.nvim",
    },
    {
        "gthelding/monokai-pro.nvim",
    },
    {
        "ribru17/bamboo.nvim",
    },
    {
        "bjarneo/vantablack.nvim",
    },
    {
        "bjarneo/white.nvim",
    },
    {
        "folke/tokyonight.nvim",
    },
    {
        "OldJobobo/retro-82.nvim",
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "java", "html", "css", "javascript", "typescript", "c", "lua", "rust", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python" },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
        },
    },
    -- "nvim-treesitter/playground", -- deprecated, merged into nvim-treesitter

    -- Utils
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    "mbbill/undotree",
    "wakatime/vim-wakatime",
    "tpope/vim-fugitive",
    "ThePrimeagen/vim-be-good",
    "ThePrimeagen/tmux-sessionizer",

    -- Formatting
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescriptreact = { "prettier" },
                    json = { "prettier" },
                    html = { "prettier" },
                    css = { "prettier" },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })
        end,
    },

    -- QoL Plugins
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    },
    --
    { "nvim-mini/mini.icons",            opts = {} },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (Trouble)" },
            { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
        },
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

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

            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                build = "make install_jsregexp",
                dependencies = { "rafamadriz/friendly-snippets" },
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end
            },
        },
    },

    {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_assume_mapped = true
            vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
        end,
    },
})
