local wo = vim.wo
local opt = vim.opt
local g = vim.g

wo.number = true
wo.relativenumber = true
wo.signcolumn = "yes"
wo.linebreak = true

g.mapleader = " "
g.maplocalleader = " "
g.editorconfig = true

-- Mouse
opt.mouse = "a"
opt.mousefocus = true

-- Line Numbers
opt.number = true
opt.relativenumber = true

-- Indent Settings
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.autoindent = true
opt.expandtab = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
-- opt.hlsearch = false
opt.incsearch = true

-- swap/undo files
opt.swapfile = false
opt.backup = false
opt.undodir = "/Users/vovan/.config/nvim/vim/undodir"
opt.undofile = true

-- scrolloffs
opt.scrolloff = 8
opt.sidescrolloff = 8

-- cursor line
opt.cursorline = true -- highlight the current cursor line
opt.colorcolumn = "120"

opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard = "unnamedplus" -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Shorter messages
opt.shortmess:append("c")

-- other
opt.isfname:append("@-@")
opt.updatetime = 50
opt.showcmd = true
opt.laststatus = 2
opt.autowrite = true
opt.autoread = true
