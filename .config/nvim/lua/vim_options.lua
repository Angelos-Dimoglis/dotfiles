-- vimrc for neovim
-- TODO: see vimrc for highlights

local opt = vim.opt
local hl = vim.api.nvim_set_hl

-- the basics
opt.fileencoding = "utf-8"

-- tab size options
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- cursor movement
opt.sidescrolloff = 999
opt.scrolloff = 999

-- show matching pairs of parenthesis
opt.showmatch = false

-- number on the side
opt.number = true
opt.relativenumber = true

-- local def_fg = "#f9f5d7"
local def_bg = "#282828"
-- local def_bg2 =  "#3d3936"

-- highlight current line
opt.cursorline = true
hl(0, "CursorlineNr", { bold = true, fg = "#f9f5d7", bg = "#3d3936"})

-------------------------------------------------------------------------------
-- COLUMNS

-- discipline column
opt.colorcolumn = "80"

-- column on the left
opt.signcolumn = "no"
hl(0, "signcolumn", { bg = def_bg })

-------------------------------------------------------------------------------
-- SEARCHING

opt.hlsearch = false  -- no highlight after search
opt.ignorecase = true -- case insensetive search
opt.incsearch = true  -- highlight while typing pattern
opt.smartcase = false --

-------------------------------------------------------------------------------
-- AUTOCOMMANDS

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
