return {
    {
        -- lsp management
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- programming languages
                    "clangd",
                    "gopls",

                    -- scripting languages
                    "bashls",
                    "lua_ls",
                    "pylsp",

                    -- markup languages
                    "tinymist",
                },
                -- default handler
                handlers = {
                    function (server_name)
                        -- print("setting up ", server_name)
                        require("lspconfig")[server_name].setup {}
                    end,
                }
            })

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- initing servers
            vim.lsp.config("clangd", {
                capabilities = capabilities
            })

            vim.lsp.config("golpls", {
                capabilities = capabilities
            })

            vim.lsp.config("bashls", {
                capabilities = capabilities
            })

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'},
                        },
                    },
                },
            })

            vim.lsp.config("pylsp", {
                capabilities = capabilities
            })

            -- vim.lsp.config("prettypst", {
                -- capabilities = capabilities
            -- })

            vim.diagnostic.config({
                virtual_text = false,
                virtual_lines = {
                    current_line = true
                }
            })
        end
    }, {
        -- completion and snippets
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path"
        },
        config = function()
            local cmp = require'cmp'
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                }, {
                        { name = 'buffer' },
                    })
            })
        end
    }
}
