-- config/nvimtree.lua
require("nvim-web-devicons").setup({
    default = true
})

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 50,
        side = "right",
    },
    renderer = {
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    filters = {
        dotfiles = false,
    },
})

-- Open nvim-tree on startup only once
vim.cmd([[
    autocmd VimEnter * if !exists("g:nvim_tree_loaded") | NvimTreeFindFile | let g:nvim_tree_loaded = 1 | endif
]])

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
