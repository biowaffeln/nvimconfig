return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
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
}
