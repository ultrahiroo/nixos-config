return {
    'williamboman/mason.nvim',
    lazy = true,
    opts = {},
    cmd = {
        'Mason',
        'MasonInstall',
        'MasonUninstall',
        'MasonUninstallAll',
        'MasonLog',
        'MasonUpdate',
    },
    build = ':MasonUpdate',
}
