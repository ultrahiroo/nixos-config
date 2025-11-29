vim.api.nvim_create_autocmd(
  { 'LspAttach' },
  {
    callback = function(args)
      local bufnr = args.buf
      local client_id = args.data.client_id
      local client = vim.lsp.get_client_by_id(client_id)
      if client:supports_method('textDocument/semanticTokens/full') then
        vim.lsp.semantic_tokens.start(bufnr, client_id)
      end
    end,
  }
)
