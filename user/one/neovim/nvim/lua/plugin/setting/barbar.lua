local opts = {
    icons = {
        button = '',
        modified = { button = '' },
        filetype = { enabled = false },
        separator = { left = '', right = '' },
        separator_at_end = false,
        inactive = { separator = { left = '', right = '' } },
    },
    maximum_padding = 0,
}

local function config()
    require('barbar').setup(opts)
    vim.keymap.set(
        { 'n', 'i', 's', 't' },
        '<C-PageUp>',
        function()
            vim.cmd('BufferPrevious')
        end
    )
    vim.keymap.set(
        { 'n', 'i', 's', 't' },
        '<C-PageDown>',
        function()
            vim.cmd('BufferNext')
        end
    )
    vim.keymap.set(
        { 'n', 'i', 's' },
        '<C-w>',
        function()
            if vim.bo.filetype == 'qf' then
                vim.cmd('bdelete')
                return
            end
            vim.cmd('BufferClose')
        end
    )
end

return {
    'romgrk/barbar.nvim',
    lazy = true,
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    config = config,
    event = {
        'BufAdd',
        'BufNewFile',
        'BufReadPost',
    },

}
