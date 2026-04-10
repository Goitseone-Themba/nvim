local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>",
    function()
        harpoon:list():select(1)
        vim.notify("In harpoon file 1", vim.log.levels.INFO, { title = "Harpoon", timeout = 2 })
    end)
vim.keymap.set("n", "<C-t>",
    function()
        harpoon:list():select(2)
        vim.notify("In harpoon file 2", vim.log.levels.INFO, { title = "Harpoon", timeout = 2 })
    end)
vim.keymap.set("n", "<C-n>",
    function()
        harpoon:list():select(3)
        vim.notify("In harpoon file 3", vim.log.levels.INFO, { title = "Harpoon", timeout = 2 })
    end)
vim.keymap.set("n", "<C-s>",
    function()
        harpoon:list():select(4)
        vim.notify("In harpoon file 4", vim.log.levels.INFO, { title = "Harpoon", timeout = 2 })
    end)
