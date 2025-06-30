local opts = {
    chunk = {
        enable = false,
        style = {
            -- { fg = '#f0f0f0' },
            { fg = '#806d9c' },
            { fg = '#c21f30' },
        },
        chars = {
            horizontal_line = '─',
            vertical_line = '│',
            left_top = '╭',
            left_bottom = '╰',
            right_arrow = '─',
        },
    },
    indent = {
        enable = true,
        use_treesitter = false,
    },
    blank = {
        enable = false,
        chars = {
            ' ',
        },
        style = {
            { bg = '#434437' },
            { bg = '#2f4440' },
            { bg = '#433054' },
            { bg = '#284251' },
        },
    },
}

return {
    'shellRaining/hlchunk.nvim',
    enabled = false,
    opts = opts,
}
