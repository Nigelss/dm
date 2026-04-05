-- numbering
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 12
vim.o.sidescroll = 10

-- indentation
vim.o.tabstop = 3
vim.o.softtabstop = 3
vim.o.shiftwidth = 3
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.expandtab = true
-- Searching
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.grepprg = "rg --vimgrep"
vim.o.grepformat = "%f:%l:%c:%m"

-- coloring// various shit
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.cmdheight = 1
vim.opt.showmode = false
vim.o.autochdir = false
vim.opt.shortmess:append("I")
vim.o.mouse = "a"
vim.o.hidden = true
vim.o.errorbells = false
vim.o.backspace = "indent,eol,start"
-- for some reason has to be .opt
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.selection = "inclusive"
vim.opt.clipboard:append("unnamedplus")
vim.opt.modifiable = true
vim.opt.encoding = "UTF-8"
vim.opt.timeoutlen = 300
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.laststatus = 0
-- vim.opt.lazyredraw = true
vim.opt.redrawtime = 10000
vim.opt.synmaxcol = 300

-- file
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.ttimeout = true
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.virtualedit = "block"
vim.opt.confirm = true
vim.opt.maxsearchcount = 9999
vim.opt.maxmempattern = 4000

local undo_dir = vim.fn.expand("~/.local/share/nvim/undo/")

vim.opt.undodir = undo_dir

if vim.fn.isdirectory(undo_dir) == false then
   vim.fn.mkdir(undo_dir, "p")
end
