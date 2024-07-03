return {
	{ "folke/which-key.nvim", opts = {} },
	{ "tpope/vim-surround" },
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
		end,
	},
	{ "mg979/vim-visual-multi" },
	{ "tpope/vim-sleuth" },
}
