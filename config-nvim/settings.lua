local o = vim.opt

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Search down into subfolders (with tab-completion)
-- o.path = ".,**"

o.completeopt = "menuone,longest,popup,fuzzy"

-- show line number and cursor position on the bar
-- nvim-defaults: o.ruler = true

-- use more prompt
o.more = true

-- allow edit buffers to be hidden
-- nvim-defaults: o.hidden = true

-- don't save files on :next & commands
o.autowrite = false

-- auto refresh file changes
-- nvim-defaults: o.autoread = true

-- don't redraw when don't need to
o.lazyredraw = true

-- cmd area with shown mode v/i/r
o.showmode = true
-- nvim-defaults: o.showcmd = true
o.cmdheight = 2

-- Search!
-- nvim-defaults: o.incsearch = true                -- incremental search
o.ignorecase = true -- search ignoring case
o.smartcase = true -- Ignore case when searching lowercase
-- nvim-defaults: o.hlsearch = true  -- highlight the search
o.showmatch = true -- show matching bracket
o.diffopt = "filler,iwhite" -- ignore all whitespace and sync

-- show relative line numbers
o.number = true
o.relativenumber = true

-- enable mouse
o.mouse = 'a'

-- Tabs!
o.expandtab = true -- replace tabs with spaces (always?)
-- nvim-defaults: o.smarttab = true  -- tabs insert spaces when used at line start
o.softtabstop = 4 -- number of spaces to insert on tab
o.tabstop = 4 -- tab displayed length
o.shiftwidth = 4 -- number of spaces to use for autoindent

-- Indents!
o.breakindent = true -- enable break indent for "wrapped" lines
o.linebreak = true -- break on a character from 'breakat'
-- nvim-defaults: o.autoindent = true  -- indent from current line to new line
o.smartindent = true -- smart indenting
o.copyindent = true -- copy existing indent to new lines
o.shiftround = true -- round indent to multiples of shiftwidth
-- (not for nvim?) o.pastetoggle = '<F3>' --  dont indent mode toggle w/F3

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Decrease update time from 4s to 250ms
o.updatetime = 250

vim.wo.signcolumn = "yes"

o.termguicolors = true
