local function config(_, opts)
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            local bufnr = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if vim.tbl_contains({ 'null-ls' }, client.name) then
                return
            end
            require('lsp_signature').on_attach(opts, bufnr)
        end,
    })
end

local opts = {
    floating_window = false,
    hint_prefix = {
        above   = ' ↙ ',
        current = ' ← ',
        below   = ' ↖ '
    }
}

return {
    'ray-x/lsp_signature.nvim',
    enabled = false,
    opts = opts,
    config = config,
    event = 'VeryLazy',
}
