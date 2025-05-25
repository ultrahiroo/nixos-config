return {
    'smoka7/hop.nvim',
    event = 'BufRead',
    version = '*',
    opts = {
        multi_windows = true,
    },
    cmd = {
        'HopWord',
        'HopPattern',
    },
}
