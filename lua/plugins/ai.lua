return {
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		opts = {},
	},
	{
		"frankroeder/parrot.nvim",
		config = function()
			require("parrot").setup({
				providers = {
					openai = {
						api_key = { "op read 'op://dev/OpenAI/credential'" },
					},
					anthropic = {
						api_key = { "op read 'op://dev/Anthropic/credential'" },
					},
				},
			})
		end,
		dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
	},
}
