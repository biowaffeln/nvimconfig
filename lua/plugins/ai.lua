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
		keys = {
			{
				"<leader>ai",
				function()
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
					print("Parrot loaded!")
				end,
				desc = "Load Parrot",
			},
		},
		dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
	},
}
