vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.cmdheight = 0
vim.opt.hlsearch = true
vim.opt.laststatus = 0
vim.opt.list = true
vim.opt.listchars:append { space = '·', eol = '⤶' }
vim.opt.mouse:remove { 'a' }
vim.opt.number = true
vim.opt.signcolumn = 'yes'
vim.opt.showcmd = false
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.updatetime = 600
vim.opt.virtualedit = 'all'
-- vim.opt.helpheight = 9999
vim.opt.scrolloff = 999 -- https://vim.fandom.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.fixendofline = false

-- Cursor Shape
-- vim.opt.guicursor = ''
-- vim.opt.guicursor = 'v-c-sm-i-ci-ve:block,r-cr-o:ver25,n:hor20'

-- Indent
vim.opt.completeopt = 'menuone,noselect'
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- behave mswin
-- From https://neovim.io/doc/user/news-0.10.html
vim.opt.keymodel = 'startsel,stopsel'
vim.opt.mousemodel = 'popup'
vim.opt.selection = 'exclusive'
vim.opt.selectmode = 'mouse,key'

-- transparency
vim.opt.winblend = 20

require('option.lsp')
