vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {
        border = 'rounded', -- 'single', 'shadow', 'none', 'rounded'
    }
)

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        update_in_insert = false,
        virtual_text = {
            format = function(diagnostic)
                return string.format('%s (%s: %s)', diagnostic.message, diagnostic.source, diagnostic.code)
            end,
        },
    }
)
