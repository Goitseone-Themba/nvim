require("oil").setup({
    view_options = {
        -- Show files and directories that start with "." by default
        show_hidden = true, -- Set to true to always show hidden files

        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
            -- Standard: hide files starting with a dot
            return vim.startswith(name, ".")
        end,

        -- This function defines what will NEVER be shown, even if show_hidden is true
        -- is_always_hidden = function(name, bufnr)
        -- Example: always hide the .git directory
        -- return name == ".git"
        -- end,
    },
})
