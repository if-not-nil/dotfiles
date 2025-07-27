require("conf.remaps")
require("conf.options")
require("conf.netrw")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "conf.plugins" },
	},
	-- automatically check for plugin updates
	change_detection = { notify = false },
	checker = { enabled = true, notify = false },
})
require("conf.autocommands")
require("conf.fork.base16").setup({
	palette = {
		base00 = "#101010",
		base01 = "#202020",
		base02 = "#2b2b2b",
		base03 = "#505050",
		base04 = "#b0b0b0",
		base05 = "#d0d0d0",
		base06 = "#e0e0e0",
		base07 = "#fafafa",
		base08 = "#ab4642",
		base09 = "#dc9656",
		base0A = "#f7ca88",
		base0B = "#a1b56c",
		base0C = "#86c1b9",
		base0D = "#7cafc2",
		base0E = "#ba8baf",
		base0F = "#a16946",
	},
})
