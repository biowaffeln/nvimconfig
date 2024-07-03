local if_nil = vim.F.if_nil

local logo = {
	[[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ]],
	[[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
	[[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
	[[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
	[[          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
	[[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
	[[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
	[[ ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
	[[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
	[[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
	[[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
}

local header = {
	type = "text",
	val = logo,
	opts = {
		position = "center",
		hl = "Type",
	},
}

local line_1 = {
	type = "text",
	val = "“perfection is attained not when there is nothing more to add,",
	opts = {
		position = "center",
		hl = "Number",
	},
}

local line_2 = {
	type = "text",
	val = "but when there is nothing more to take away.”",
	opts = {
		position = "center",
		hl = "Number",
	},
}

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 0,
		width = 50,
		align_shortcut = "right",
		hl_shortcut = "Keyword",
	}
	sc = sc:gsub(" ", "")
	if keybind then
		keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(keybind or sc .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

local buttons = {
	type = "group",
	val = {
		button("e", "new file", "<cmd>ene <CR>"),
		button("<leader> f f", "find file"),
		button("<leader> f g", "find grep"),
		button("<leader> f r", "find recent"),
	},
	opts = {
		spacing = 1,
	},
}

local config = {
	layout = {
		{ type = "padding", val = 5 },
		header,
		{ type = "padding", val = 2 },
		line_1,
		line_2,
		{ type = "padding", val = 2 },
		buttons,
		{ type = "padding", val = 4 },
	},
	opts = {
		margin = 5,
	},
}

return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("alpha").setup(config)
	end,
}
