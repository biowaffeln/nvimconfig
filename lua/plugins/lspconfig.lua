local function config()
	vim.api.nvim_create_autocmd("LspAttach", {
		desc = "LSP actions",
		callback = function(event)
			local function set_lsp_keymap(mode, key, action, opts)
				local options = { buffer = event.buf }
				if opts then
					options = vim.tbl_extend("force", options, opts)
				end
				vim.keymap.set(mode, key, action, options)
			end

			-- "Goto" Shortcuts
			set_lsp_keymap("n", "K", function()
				vim.lsp.buf.hover()
			end, { desc = "Display hover information" })
			set_lsp_keymap("n", "gd", function()
				vim.lsp.buf.definition()
			end, { desc = "[G]oto [D]efinition" })
			set_lsp_keymap("n", "gi", function()
				vim.lsp.buf.implementation()
			end, { desc = "[G]oto [I]mplementation" })
			set_lsp_keymap("n", "gr", function()
				vim.lsp.buf.references()
			end, { desc = "[G]oto [R]eferences" })

			-- "Code" Shortcuts
			set_lsp_keymap("n", "cs", function()
				vim.lsp.buf.signature_help()
			end, { desc = "Display [S]ignature Information" })
			set_lsp_keymap("n", "<leader>cr", function()
				vim.lsp.buf.rename()
			end, { desc = "[R]ename" })
			set_lsp_keymap("n", "<leader>ca", function()
				vim.lsp.buf.code_action()
			end, { desc = "[C]ode [A]ctions" })

			-- "Diagnostics" Shortcuts
			set_lsp_keymap("n", "<leader>do", function()
				vim.diagnostic.open_float()
			end, { desc = "[D]iagnostics: [O]pen" })
			set_lsp_keymap("n", "<leader>dp", function()
				vim.diagnostic.goto_prev()
			end, { desc = "[D]iagnostics: [P]revious" })
			set_lsp_keymap("n", "<leader>dn", function()
				vim.diagnostic.goto_next()
			end, { desc = "[D]iagnostics: [N]ext" })
			set_lsp_keymap("n", "<leader>dh", function()
				vim.diagnostic.hide()
			end, { desc = "[D]iagnostics: [H]ide" })
			set_lsp_keymap("n", "<leader>ds", function()
				vim.diagnostic.show()
			end, { desc = "[D]iagnostics: [S]how" })
		end,
	})

	require("neodev").setup()
	require("mason").setup()

	local servers = {
		astro = {},
		cssls = {},
		eslint = {},
		jsonls = {},
		lua_ls = {},
		rust_analyzer = {},
		tailwindcss = {},
		tsserver = {},
		svelte = {},
		emmet_ls = {},
		pyright = {},
		zls = {},
		gopls = {},
		templ = {},
	}

	require("mason-lspconfig").setup({
		ensure_installed = vim.tbl_keys(servers),
	})

	local lspconfig = require("lspconfig")
	local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

	require("mason-lspconfig").setup_handlers({
		function(server_name)
			local opts = vim.tbl_deep_extend("force", {
				capabilities = lsp_capabilities,
			}, servers[server_name])
			lspconfig[server_name].setup(opts)
		end,
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
	},
}
