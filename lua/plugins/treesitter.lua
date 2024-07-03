local function init()
	require("nvim-treesitter.configs").setup({
		enable = true,
		ensure_installed = {
			"javascript",
			"typescript",
			"vimdoc",
			"vim",
			"tsx",
			"svelte",
			"lua",
			"python",
			"rust",
			"go",
		},
		highlight = { enable = true },
		indent = { enable = true },
		modules = {},
		auto_install = true,
		sync_install = false,
		ignore_install = {},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	init = init,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
}
