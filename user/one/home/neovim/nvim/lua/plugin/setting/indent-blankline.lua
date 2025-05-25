local opts = {
    scope = {
        enabled = false,
    }
}

return {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    opts = opts,
    main = 'ibl',
    event = { 'CursorHold', 'CursorHoldI' },
}
