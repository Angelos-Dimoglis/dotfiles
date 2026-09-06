# enable new ui
require("vim._core.ui2").enable({})

require("options")
require("keymaps")

vim.pack.add({
    -- interface related plugins
    { src = "https://github.com/ellisonleao/gruvbox.nvim", priority = 1000 },
    { src = "https://github.com/nvim-mini/mini.statusline" },
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/brenoprata10/nvim-highlight-colors" },
})

require("gruvbox").setup()
vim.cmd.colorscheme("gruvbox")

-- highlight current line
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorlineNr", {
    bold = true,
    fg = "#f9f5d7",
    bg = "#3d3936"
})
vim.api.nvim_set_hl(0, "Cursorline", {
    bold = true,
    bg = "#3d3936"
})

require('mini.statusline').setup()
require('mini.icons').setup()
require('nvim-highlight-colors').setup({})
