return {
    'alexpasmantier/pymple.nvim',
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        -- 'stevearc/dressing.nvim', -- Optional
        -- 'nvim-tree/nvim-web-devicons', -- Optional
    },
    build = ':PympleBuild',
    opts = {
        keymaps = {
            resolve_import_under_cursor = {
                desc = 'Resolve import under cursor',
                keys = '<C-l>',
            },
        },
    },
    config = function()
        require('pymple').setup()
    end,
    event = {
        'BufAdd',
        'BufNewFile',
        'BufReadPost',
    },
    cmd = {
        'PympleBuild',
        'PympleLogs',
        'PympleResolveImport',
        'PympleUpdateImports',
    },
}
