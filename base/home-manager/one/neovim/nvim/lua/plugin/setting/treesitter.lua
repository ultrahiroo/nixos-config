local opts = {
    install_dir = vim.fn.stdpath('cache') .. '/plugin',
    ensure_installed = {
        'c',
        'cpp',
        'javascript',
        'json',
        'lua',
        'markdown',
        'python',
        'typescript',
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    auto_install = true,
    incremental_selection = {
        enable = true,
        keymaps = {
            -- init_selection = '<CR>',
            -- scope_incremental = '<CR>',
            -- node_incremental = '<TAB>',
            -- node_decremental = '<S-TAB>',
        },
    },
}

return {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    opts = opts,
    build = ':TSUpdate',
    event = 'BufReadPre',
}
