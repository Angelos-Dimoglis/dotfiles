
> [!NOTE]
> This README will be redone in the future.
> Feel free to read (or not read) these notes.

## TODO 

* look into code actions
* typst preview
* add links to plugin table

## Features Implemented

* options
* keymaps 

<table>
    <tr>
        <th> Category </th>
        <th> Plugin </th>
    </tr>
    <tr>
        <td> Package Manager </td>
        <td> <a href="https://github.com/folke/lazy.nvim">lazy.nvim</a> </td>
    </tr>
    <tr>
        <td> User Interface </td>
        <td>
            <ul>
                <li> Theme: <a href="https://github.com/ellisonleao/gruvbox.nvim">gruvbox.nvim</a> </li>
                <li> Icons: <a href="https://github.com/nvim-mini/mini.icons"> mini.icons</a> </li>
                <li> Status Line: <a href="https://github.com/nvim-mini/mini.statusline">mini.statusline</a> </li>
                <li> Color Highlights: <a href="https://github.com/brenoprata10/nvim-highlight-colors">nvim-highlight-colors</a> </li>
            </ul>
        </td>
    </tr>
    <tr>
        <td> Language Inteligence Tools </td>
        <td>
            <ul>
                <li> Parsers: <a href="https://github.com/nvim-treesitter/nvim-treesitter">nvim-treesitter </a></li>
                <li> LSP related plugins</li>
                <ul>
                    <li> <a href="https://github.com/neovim/nvim-lspconfig">nvim-lspconfig</a> </li>
                    <li> <a href="https://github.com/mason-org/mason-lspconfig.nvim">mason-lspconfig.nvim</a> </li>
                    <li> <a href="https://github.com/mason-org/mason.nvim">mason.nvim</a> </li>
                </ul>
                <li> Completion </li>
                <ul>
                    <li> <a href="https://github.com/hrsh7th/nvim-cmp">nvim-cmp</a> </li> 
                    <li> <a href="https://github.com/hrsh7th/cmp-nvim-lsp">cmp-nvim-lsp </a></li>
                    <li> <a href="https://github.com/hrsh7th/cmp-path">cmp-path </a></li>
                </ul>
                <li> Snippets </li>
                <ul>
                    <li> <a href="https://github.com/L3MON4D3/LuaSnip">LuaSnip </a></li>
                    <li> <a href="https://github.com/saadparwaiz1/cmp_luasnip">cmp_luasnip </a></li>
                    <li> <a href="https://github.com/rafamadriz/friendly-snippets">friendly-snippets </a></li>
                </ul>
            </ul>
        </td>
    </tr>
    <tr>
        <td> Programming Assistance Tools </td>
        <td>
            <ul>
                <li> Undo History Visualizer: <a href="https://github.com/mbbill/undotree">undotree </a> </li>
                <li> Paired Text </li>
                <ul>
                    <li> <a href="https://github.com/windwp/nvim-autopairs">autopairs </a> </li>
                    <li> <a href="https://github.com/kylechui/nvim-surround">nvim-surround </a> </li>
                </ul>
                <li> Commenting </li>
                <ul>
                    <li> <a href="https://github.com/numToStr/Comment.nvim">Comment.nvim </a> </li>
                    <li> <a href="https://github.com/folke/todo-comments.nvim">todo-comments.nvim </a> </li>
                </ul>
            </ul>
        </td>
    </tr>
    <tr>
        <td> File Manager </td>
        <td> <a href="https://github.com/stevearc/oil.nvim">oil.nvim </a> </td>
    </tr>
    <tr>
        <td> Fuzzy Finder </td>
        <td> <a href="https://github.com/nvim-telescope/telescope.nvim">telescope.nvim </a> </td>
    </tr>
    <tr>
        <td> Markup Languages Plugins </td>
        <td>
            <ul>
                <li> render markdown in buffer </li>
                <li> typst preview </li>
            </ul>
        </td>
    </tr>
</table>

## Features **NOT** Implemented

### git integration

* fugative
* gitsigns
* git in mini.statusline
* jump to merge conflict (keybind)

### Programming

* [ensure.nvim](https://www.reddit.com/r/neovim/comments/1prkgzp/ensurenvim_centralize_your_lsp_formatters_linters/)
* debugger (nvim-dap)
* aerial.nvim (folding and function navigation)

### documentations & notes

* spellcheck

### mail

* email interface

### primeagen

* quick fix list
* vim be good training game

