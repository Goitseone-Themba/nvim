local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', function()
	local ok, err = pcall(builtin.git_files)
	if not ok then
		vim.notify("Not in a git repository", vim.log.levels.WARN)
	end
end, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("rg > ") });
end)
