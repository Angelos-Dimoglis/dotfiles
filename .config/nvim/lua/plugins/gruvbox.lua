return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    --config = true,
    opts = ...,
    config = function()
        vim.cmd("set background=dark")
        vim.cmd("colorscheme gruvbox")
    end
}
