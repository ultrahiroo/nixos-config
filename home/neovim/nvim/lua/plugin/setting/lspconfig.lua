local function config()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local mason_lspconfig = require('mason-lspconfig')
    local lsp_selection_range = require('lsp-selection-range')
    local lsr_client = require('lsp-selection-range.client')
    lsp_selection_range.setup({
        get_client = lsr_client.select_by_filetype(lsr_client.select)
    })
    capabilities = lsp_selection_range.update_capabilities(capabilities)

    local server = {
        -- lua_ls = {},
        -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/lua/mason-lspconfig/server_configurations/pylsp/README.md
        -- :PylspInstall pyls-flake8
        -- pylsp = {},
        -- pyright = {},
        -- pyre = {},
    }
    mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(server),
    }
    mason_lspconfig.setup_handlers {
        function(server_name)
            lspconfig[server_name].setup {
                capabilities = capabilities,
                settings = server[server_name],
            }
        end,
    }

    -- https://github.com/williamboman/mason.nvim/issues/647
    lspconfig.clangd.setup({
        cmd = {
            'clangd',
            '--enable-config',
        },
    })

    -- lspconfig.pyre.setup({
    --     cmd = {
    --         'pyre',
    --     },
    -- })

    -- lspconfig.pylyzer.setup({
    --     cmd = {'pylyzer', '--server' },
    --     filetypes = { 'python' },
    --     settings = {
    --         python = {
    --             checkOnType = false,
    --             diagnostics = true,
    --             inlayHints = true,
    --             smartCompletion = true,
    --         },
    --     },
    --     single_file_support = true,
    -- })

    vim.keymap.set(
        'n',
        '<C-o>',
        function()
            lsp_selection_range.trigger()
        end
    )
    vim.keymap.set(
        'v',
        '<C-o>',
        function()
            lsp_selection_range.expand()
        end
    )
end

return {
    'neovim/nvim-lspconfig',
    lazy = true,
    dependencies = {
        { 'williamboman/mason-lspconfig.nvim' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'camilledejoye/nvim-lsp-selection-range' },
    },
    config = config,
    event = { 'BufReadPre', 'BufNewFile' },
}
