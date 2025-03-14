return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.2",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "comment",
                "c",
                "cpp",
                "lua",
                "python",
                "bash",
                "vim",
                "vimdoc",
                "markdown",
                "latex"
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}

