require("vandev.remap")
require("vandev.lazy")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = false
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
})
