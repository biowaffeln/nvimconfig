-- associate nunjucks files with html
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.njk" },
	callback = function()
		vim.bo.filetype = "html"
	end,
})

-- weird fix required for the file watcher to work on MacOS
-- https://github.com/sveltejs/language-tools/issues/2008
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.name == "svelte" then
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = { "*.js", "*.ts" },
				callback = function(ctx)
					client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
				end,
			})
		end
	end,
})

-- toggle cursorline on insert mode
vim.api.nvim_create_augroup("CursorLineToggle", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
	group = "CursorLineToggle",
	callback = function()
		vim.opt.cursorline = true
	end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
	group = "CursorLineToggle",
	callback = function()
		vim.opt.cursorline = false
	end,
})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})
