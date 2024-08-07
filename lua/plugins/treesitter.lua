local function config()
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
			"templ",
		},
		highlight = { enable = true },
		indent = { enable = true },
		modules = {},
		auto_install = true,
		sync_install = false,
		ignore_install = {},
		additional_vim_regex_highlighting = false,
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	config = config,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
}
