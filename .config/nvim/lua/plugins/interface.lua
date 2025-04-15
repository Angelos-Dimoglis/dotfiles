return {
    {
        -- color scheme
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        opts = ...,
        config = function()
            vim.cmd.colorscheme "gruvbox"

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
        end
    }, {
        -- icons
        'echasnovski/mini.icons',
        version = false,
        config = function()
            require('mini.icons').setup()
        end
    }, {
        -- status-line
        'echasnovski/mini.statusline',
        version = false,
        config = function()

            local my_active_content = function()
                print("testing_statusline")
            end

            require('mini.statusline').setup({
                -- Content of statusline as functions which return statusline
                -- string. See `:h statusline` and code of default contents
                -- (used instead of `nil`).
                content = {
                    -- Content for active window
                    active = nil,
                    -- Content for inactive window(s)
                    inactive = nil,
                },

                -- Whether to use icons by default
                use_icons = true,
            })
        end
    }, {
        -- css colors (highlight hex in neovim)
        'brenoprata10/nvim-highlight-colors',
        config = function ()
            require("nvim-highlight-colors").setup {
                ---Render style
                ---@usage 'background'|'foreground'|'virtual'
                render = 'background',

                ---Set virtual symbol (requires render to be set to 'virtual')
                virtual_symbol = '■',

                ---Set virtual symbol suffix (defaults to '')
                virtual_symbol_prefix = '',

                ---Set virtual symbol suffix (defaults to ' ')
                virtual_symbol_suffix = ' ',

                ---Set virtual symbol position()
                ---@usage 'inline'|'eol'|'eow'
                ---inline mimics VS Code style
                ---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
                ---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
                virtual_symbol_position = 'inline',

                ---Highlight hex colors, e.g. '#FFFFFF'
                enable_hex = true,

                ---Highlight rgb colors, e.g. 'rgb(0 0 0)'
                enable_rgb = true,

                ---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
                enable_hsl = true,

                ---Highlight CSS variables, e.g. 'var(--testing-color)'
                enable_var_usage = true,

                ---Highlight named colors, e.g. 'green'
                enable_named_colors = true,

                ---Highlight tailwind colors, e.g. 'bg-blue-500'
                enable_tailwind = false,

                ---Set custom colors
                ---Label must be properly escaped with '%' to adhere to `string.gmatch`
                --- :help string.gmatch
                custom_colors = {
                    { label = '%-%-theme%-primary%-color', color = '#0f1219' },
                    { label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
                }
            }
        end
    }
}
