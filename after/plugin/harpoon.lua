local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) vim.notify("In harpoon file 1", vim.log.levels.INFO, {title = "Harpoon", timeout = 5}) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)



-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) vim.notify("In harpoon file 1", vim.log.levels.INFO, {title = "Harpoon",timeout = 200}) -- also print("in harpoon file 1") also worked end, { desc = "Jump to first Harpoon file" })
