return {
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    }, {
        "windwp/nvim-autopairs",
        event = {"InsertEnter"},
        dependencies = {
            "hrsh7th/nvim-cmp"
        },
        config = function ()
            local autopairs = require("nvim-autopairs")

            autopairs.setup({
                check_ts = true,
                ts_config = {
                    lua = { "string" },
                }
            })

            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp  = require("cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    }, {
        -- to surround: ys + <montion> + {(, {, ", '}
        -- to change: cs + {(, {, ", '}
        -- to delte: ds + {(, {, ", '}
        "kylechui/nvim-surround",
        event = { "BufReadPre", "BufNewFile" },
        version = "*", -- Use for stability; omit to use `main` branch for the
        -- latest features
        config = true,
    }, {
        -- comment stuff with "gc + <motion>"
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function ()
            local comment = require("Comment")
            comment.setup()
        end
    }, {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local todo_comments = require("todo-comments")

            -- set keymaps
            local keymap = vim.keymap -- for conciseness

            keymap.set("n", "]t", function()
                todo_comments.jump_next()
            end, { desc = "Next todo comment" })

            keymap.set("n", "[t", function()
                todo_comments.jump_prev()
            end, { desc = "Previous todo comment" })

            todo_comments.setup()
        end,
    },
}
