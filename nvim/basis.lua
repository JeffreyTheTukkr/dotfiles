-- set file encoding
vim.opt.encoding = utf-8
vim.opt.fileencoding = "utf-8"

-- improve clipboard
vim.opt.clipboard = "unnamedplus"

-- enable gui colors
vim.opt.termguicolors = true

-- display relative and normal line number
vim.opt.number = true
vim.opt.relativenumber = true

-- improve search
vim.opt.hlsearch = true
-- todo: check if this is the wanted value
vim.opt.hlsearch = true

-- enable mouse usage
vim.opt.mouse = "a"

-- set shift width
vim.opt.shiftwidth = 4

-- highlight current line
vim.opt.cursorline = true

-- scroll 8 lines by default
vim.opt.scrolloff = 8

-- split to bottom and to right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- performance improvements
vim.opt.updatetime = 600

-- disable backups and swap 
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- check if it makes a difference
-- vim.opt.cmdheight = 1

-- no fucking idea what it does
-- vim.opt.showmode = false
