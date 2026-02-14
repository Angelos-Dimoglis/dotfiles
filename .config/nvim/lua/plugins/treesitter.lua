return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                -- programming languages
                "c",
                "cpp",
                "go",

                -- scripting languages
                "bash",
                "lua",
                "python",

                -- markup languages
                "markdown",
                "typst",

                -- serialization languages
                "yaml",

                -- other
                "comment",
                "vim",
                "vimdoc",
                "query"
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
