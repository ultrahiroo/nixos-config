local function help(opts)
    vim.cmd('help ' .. opts.args)
    vim.cmd('only')
end

vim.api.nvim_create_user_command(
    'H',
    function(opts)
        help(opts)
    end,
    { nargs = 1, complete = 'help' }
)

vim.api.nvim_create_user_command(
    'Help',
    function(opts)
        help(opts)
    end,
    { nargs = 1, complete = 'help' }
)

vim.api.nvim_create_user_command(
    'ReloadConfig',
    function()
        vim.cmd([[
            source $MYVIMRC
            startinsert
        ]])
    end,
    {}
)

vim.api.nvim_create_user_command(
    'OpenConfig',
    function()
        vim.cmd([[
            badd $MYVIMRC
            bnext
            startinsert
        ]])
    end,
    {}
)

vim.api.nvim_create_user_command(
    'Print',
    function(opts)
        vim.api.nvim_input(':lua print(vim.inspect(' .. opts.args .. '))<Left><Left>')
    end,
    { nargs = '?', complete = 'lua' }
)

vim.api.nvim_create_user_command(
    'PrintKeymap',
    function(opts)
        vim.cmd('verbose map ' .. opts.args)
    end,
    { nargs = 1 }
)

vim.api.nvim_create_user_command(
    'Replace',
    function(opts)
        vim.api.nvim_input(':%s/' .. opts.fargs[1] .. '/' .. opts.fargs[2] .. '/gc')
    end,
    { nargs = '*' }
)

vim.api.nvim_create_user_command(
    'LspFormat',
    function()
        vim.lsp.buf.format()
    end,
    {}
)

vim.api.nvim_create_user_command(
    'Format',
    function()
        vim.lsp.buf.format()
    end,
    {}
)

vim.api.nvim_create_user_command(
    'LspDefinition',
    function()
        vim.lsp.buf.definition()
    end,
    {}
)

vim.api.nvim_create_user_command(
    'LspRename',
    function()
        vim.lsp.buf.rename()
    end,
    {}
)

vim.api.nvim_create_user_command(
    'Rename',
    function()
        vim.lsp.buf.rename()
    end,
    {}
)

vim.api.nvim_create_user_command(
    'LspReference',
    function()
        vim.lsp.buf.references()
        -- vim.lsp.buf.references(nil, { loclist = true })
        -- vim.cmd('Telescope lsp_definitions')
    end,
    {}
)

vim.api.nvim_create_user_command(
    'LspReload',
    function()
        local bufnr = vim.api.nvim_get_current_buf()
        local client_list = vim.lsp.get_clients({ bufnr = bufnr })
        for i = 1, #client_list do
            local client_name = client_list[i].name
            vim.cmd('LspRestart ' .. client_name)
        end
    end,
    {}
)

vim.api.nvim_create_user_command(
    'LspCodeAction',
    function()
        vim.lsp.buf.code_action()
    end,
    {}
)

vim.api.nvim_create_user_command(
    'LspImplementation',
    function()
        vim.lsp.buf.implementation()
    end,
    {}
)

vim.api.nvim_create_user_command(
    'LspTypeDefinition',
    function()
        vim.lsp.buf.type_definition()
    end,
    {}
)
vim.api.nvim_create_user_command(
    'LspImplementation',
    function()
        vim.lsp.buf.implementation()
    end,
    {}
)
vim.api.nvim_create_user_command(
    'LspHover',
    function()
        vim.lsp.buf.hover()
    end,
    {}
)
vim.api.nvim_create_user_command(
    'LspSignatureHelp',
    function()
        vim.lsp.buf.signature_help()
    end,
    {}
)

vim.api.nvim_create_user_command(
    'LspDeclaration',
    function()
        vim.lsp.buf.declaration()
    end,
    {}
)
vim.api.nvim_create_user_command(
    'LspAddWorkspaceFolder',
    function()
        vim.lsp.buf.add_workspace_folder()
    end,
    {}
)
vim.api.nvim_create_user_command(
    'LspRemoveWorkspaceFolder',
    function()
        vim.lsp.buf.remove_workspace_folder()
    end,
    {}
)
vim.api.nvim_create_user_command(
    'LspListWorkspaceFolders',
    function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    {}
)
