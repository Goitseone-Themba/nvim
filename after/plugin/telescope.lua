-- Telescope's pinned previewer still calls this Treesitter helper, which was
-- removed in newer Neovim releases (including 0.12).
if vim.treesitter and vim.treesitter.language
	and not vim.treesitter.language.ft_to_lang
	and vim.treesitter.language.get_lang then
	vim.treesitter.language.ft_to_lang = vim.treesitter.language.get_lang
end

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
