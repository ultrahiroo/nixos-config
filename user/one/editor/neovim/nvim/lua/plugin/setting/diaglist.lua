local function config(_, opts)
    require('diaglist').init(opts)
    vim.api.nvim_create_user_command(
        'LspFix',
        function()
            require('diaglist').open_all_diagnostics()
        end,
        {}
    )
    vim.api.nvim_create_user_command(
        'LspFixBuf',
        function()
            require('diaglist').open_buffer_diagnostics()
        end,
        {}
    )
end

return {
    'onsails/diaglist.nvim',
    enabled = true,
    lazy = true,
    opts = {
        debug = false,
        debounce_ms = 150,
    },
    config = config,
    cmd = { 'LspFix', 'LspFixBuf' },
}
