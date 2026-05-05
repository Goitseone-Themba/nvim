require("lualine").setup({
    options = {
        theme = "auto",
        component_separators = "",
        section_separators = "",
        globalstatus = true,
        disabled_filetypes = {
            statusline = { "dashboard" },
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename", "diagnostics" },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
})
