return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		window = {
			position = "right",
			mappings = {
				["o"] = { "open", nowait = true },
				["oc"] = "noop",
				["od"] = "noop",
				["og"] = "noop",
				["om"] = "noop",
				["on"] = "noop",
				["os"] = "noop",
				["ot"] = "noop",
			},
		},
	},
	init = function()
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle NeoTree" })
	end,
}
