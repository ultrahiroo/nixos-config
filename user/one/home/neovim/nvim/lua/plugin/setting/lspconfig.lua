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
        clangd = {
            cmd = {
              'clangd',
              '--enable-config',
            },
        },
        lua_ls = {},
        nil_ls = {},
        pylsp = {},
        pylyzer = {
            cmd = {'pylyzer', '--server' },
            filetypes = { 'python' },
            settings = {
                python = {
                    checkOnType = false,
                    diagnostics = true,
                    inlayHints = true,
                    smartCompletion = true,
                },
            },
            single_file_support = true,
        },
        pyre = {
            cmd = {
                'pyre',
                'persistent',
            },
        },
        pyright = {},
    }

    mason_lspconfig.setup {
        automatic_enable = false,
        -- ensure_installed = vim.tbl_keys(server),
    }

    for server_name, _ in pairs(server) do
        vim.lsp.enable(server_name)
        config = server[server_name]
        -- config['capabilities'] = capabilities
        vim.lsp.config(server_name, config)
    end

    vim.lsp.config('*', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })

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
