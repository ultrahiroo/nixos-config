return {
    'petertriho/nvim-scrollbar',
    enabled = false,
    event = {
        'BufWinEnter',
        'CmdwinLeave',
        'TabEnter',
        'TermEnter',
        'TextChanged',
        'VimResized',
        'WinEnter',
        'WinScrolled',
    },
    config = function()
        require('scrollbar').setup {
            handle = {
                -- color = colors.bg_highlight,
                blend = 0,
            },
            handlers = {
                cursor = false,
                diagnostic = true,
                gitsigns = false,
                handle = true,
                search = false,
                ale = false,
            },
        }
    end,
}
