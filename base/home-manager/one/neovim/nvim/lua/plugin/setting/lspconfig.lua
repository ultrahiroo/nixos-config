local function config()
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
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
    -- nil_ls = {
    --     settings = {
    --         ['nil'] = {
    --             formatting = {
    --                 command = { 'nixfmt' },
    --             },
    --         },
    --     },
    -- },
    nixd = {
      settings = {
        nixd = {
          formatting = {
            command = { 'nixfmt' },
          },
        },
      },
    },
    pylsp = {},
    pylyzer = {
      cmd = { 'pylyzer', '--server' },
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
    pyright = {},
    ts_ls = {},
    -- pyrefly = {},
    qmlls = {},
  }

  for server_name, _ in pairs(server) do
    local _config = server[server_name]
    _config['capabilities'] = capabilities
    vim.lsp.config(server_name, _config)
    vim.lsp.enable(server_name)
  end

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
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'camilledejoye/nvim-lsp-selection-range' },
  },
  config = config,
  event = { 'BufReadPre', 'BufNewFile' },
}
