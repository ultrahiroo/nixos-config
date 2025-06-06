return {
    'mvllow/modes.nvim',
    lazy = true,
    config = function()
        require('modes').setup({
            colors = {
                copy = '#f5c359',
                delete = '#c75c6a',
                insert = '#78ccc5',
                visual = '#9745be',
            },
        })
    end,
    event = { 'VimEnter' },
}
