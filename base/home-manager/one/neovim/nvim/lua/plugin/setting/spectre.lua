return {
    'nvim-pack/nvim-spectre',
    config = function()
        require('spectre').setup({
        })
        vim.api.nvim_create_user_command(
            'SpectreReplace',
            function()
                require('spectre.actions').run_replace()
            end,
            {}
        )
        vim.api.nvim_create_user_command(
            'SpectreDeleteLine',
            function()
                require('spectre.actions').run_delete_line()
            end,
            {}
        )
    end,
    cmd = {
        'Spectre',
    },
}
