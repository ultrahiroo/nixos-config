-- vim.api.nvim_create_autocmd(
--     { 'VimEnter' },
--     {
--         callback = function()
--             vim.cmd('Neotree')
--             vim.cmd('wincmd p')
--         end,
--         pattern = '*',
--     }
-- )

local function config()
    require('neo-tree.command').execute({
        action = 'focus',
        source = 'filesystem',
        position = 'left',
        reveal_force_cwd = true,
    })
end

return {
    'nvim-neo-tree/neo-tree.nvim',
    enabled = false,
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'nvim-tree/nvim-web-devicons',
        '3rd/image.nvim',
    },
    event = {
        'VimEnter',
    },
    config = config,
    cmd = {
        'Neotree',
    },
}
