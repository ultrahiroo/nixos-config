-- https://github.com/akinsho/toggleterm.nvim/issues/605
-- https://zenn.dev/kyoh86/articles/b81c401cecc91c
return {
    'akinsho/toggleterm.nvim',
    lazy = true,
    opts = {
        size = 80,
        autochdir = true,
        shade_terminals = false,
        insert_mappings = false,
        terminal_mappings = false,
        direction = 'vertical',
    },
    config = function(_, opts)
        local toggleterm = require('toggleterm')
        toggleterm.setup(opts)

        if false then
            vim.keymap.set(
                { 'n', 'i' },
                '<C-t>',
                '<CMD>:ToggleTerm<CR>'
            )
            vim.keymap.set(
                { 't' },
                '<C-t>',
                '<CMD>:ToggleTerm<CR>'
            )
        end
        vim.keymap.set(
            { 't' },
            '<C-w>',
            function()
                vim.cmd('ToggleTerm')
            end
        )
    end,
    cmd = {
        'ToggleTerm',
    },
}
