local opts = {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
}

return {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    opts = opts,
    event = { 'CursorHold', 'CursorHoldI' },
}
