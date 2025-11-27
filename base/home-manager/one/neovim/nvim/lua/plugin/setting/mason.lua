return {
    "mason-org/mason-lspconfig.nvim",
    enabled = false,
    lazy = true,
    opts = {},
    dependencies = {
        {
            'mason-org/mason.nvim',
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
        },
        "neovim/nvim-lspconfig",
    },
}
