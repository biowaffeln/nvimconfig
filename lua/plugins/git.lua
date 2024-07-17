return {
	{
		keys = {
			{ "<leader>gl", "<cmd>LazyGit<CR>", desc = "LazyGit" },
		},
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{ "tpope/vim-fugitive" },
	{ "lewis6991/gitsigns.nvim", opts = {} },
}
