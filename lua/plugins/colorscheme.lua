return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		name = "rose-pine",
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		init = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
}
