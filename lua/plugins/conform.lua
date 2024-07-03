return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				svelte = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				graphql = { "prettierd" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
		})
		-- set up format on save
		local function format()
			conform.format({ lsp_fallback = true, async = false, timeout_ms = 500 })
		end

		local format_on_save_enabled = true

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function()
				if format_on_save_enabled then
					format()
				end
			end,
		})
		-- keymaps
		vim.keymap.set({ "n", "v" }, "<leader>cf", format, { desc = "[C]ode [F]ormat" })
		vim.keymap.set({ "n" }, "<leader>ctf", function()
			vim.g.format_on_save_enabled = not vim.g.format_on_save_enabled
			if vim.g.format_on_save_enabled then
				print("Format on save: Enabled")
			else
				print("Format on save: Disabled")
			end
		end, { desc = "[C]ode [T]oggle [F]ormat on save" })
	end,
}
