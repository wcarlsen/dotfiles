local set = vim.opt

-- Spacing and indentation
set.autoindent = true
set.smartindent = true
set.wrap = true
set.linebreak = true
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2

-- Files
set.swapfile = false
set.backup = false
set.writebackup = false

-- UI
set.cursorline = true
set.showmatch = true
set.relativenumber = true
set.termguicolors = true

-- Search
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- Split
set.splitbelow = true
set.splitright = true
-- Menus set.wildmenu = true
set.completeopt = "menuone,menu,noselect,noinsert"

-- Encoding
set.encoding = "utf8"
