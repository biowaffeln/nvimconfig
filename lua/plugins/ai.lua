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

			local function map(key, cmd, desc)
				vim.keymap.set("n", key, "<cmd>Prt" .. cmd .. "<CR>", { desc = desc })
			end

			local function vmap(key, cmd, desc)
				map(key, cmd, desc)
				vim.keymap.set("v", key, ":'<,'>Prt" .. cmd .. "<CR>", { desc = desc })
			end

			vmap("<leader>k", "Rewrite", "Rewrite code with instructions")
			vmap("<leader>i", "Implement", "Complete code")
			vmap("<leader>l", "ChatNew", "Open new Chat")

			map("<leader>pt", "ChatToggle", "[P]arrot: [T]oggle chat")
			map("<leader>pr", "ChatRespond", "[P]arrot: [R]espond in chat")
			map("<leader>ps", "Stop", "[P]arrot: [S]top generation")
		end,
		dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
	},
}
