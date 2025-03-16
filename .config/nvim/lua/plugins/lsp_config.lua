return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "bashls",
                    "clangd",
                    "pylsp",
                    "texlab"
                }
            })
        end
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilites = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilites = capabilites;
                settings = { Lua = { diagnostics = { globals = {'vim'}, }, }, },
            })
            lspconfig.clangd.setup({
                filetypes = { "c", "cpp", "objc", "objcpp" },
                capabilites = capabilites;
                cmd = {
                    "clangd",
                    "--clang-tidy",
                    "--completion-style=bundled",
                    "--function-arg-placeholders",
                    "--cross-file-rename",
                    "--header-insertion=iwyu",
                    "--malloc-trim",
                    "--pch-storage=memory",
                },
                init_options = {
                    usePlaceholders = true,
                    semanticHighlighting = true,
                },

            })
            lspconfig.bashls.setup({
               filetypes = {"bash", "sh"},
               capabilites = capabilites,
               cmd = {"bash-language-server", "start"}
            })
            lspconfig.pylsp.setup({
                capabilites = capabilites;
            })
            lspconfig.texlab.setup({
                capabilites = capabilites;
            })
        end
    }
}
