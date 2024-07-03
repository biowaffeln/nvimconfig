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
		if client.name == "svelte" then
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = { "*.js", "*.ts" },
				callback = function(ctx)
					client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
				end,
			})
		end
	end,
})
