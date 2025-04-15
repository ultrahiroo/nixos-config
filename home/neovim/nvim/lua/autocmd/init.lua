vim.api.nvim_create_autocmd(
    { 'VimEnter' },
    {
        callback = function()
            local original_cwd = vim.fn.getcwd()
            vim.cmd('NvimTreeOpen')
            vim.api.nvim_set_current_dir(original_cwd)
            vim.cmd('ToggleTerm')
            vim.cmd('wincmd w')
            vim.cmd('wincmd w')
        end,
    }
)

vim.api.nvim_create_autocmd(
    {
        'ModeChanged',
    },
    {
        callback = function(args)
            local request = vim.b[args.buf].request_save_mode
            if (request == nil or request == true) then
                vim.b[args.buf].current_mode = vim.fn.mode()
                vim.b[args.buf].request_save_mode = false
            end
        end,
    }
)

local function is_quickfix(file)
    return file == ''
end

-- arg = nil

vim.api.nvim_create_autocmd(
    {
        'BufEnter',
    },
    {
        pattern = '/*',
        callback = function(args)
            -- arg = args
            if is_quickfix(args.file) then
                return
            end

            local saved_mode = vim.b[args.buf].current_mode
            if saved_mode == nil then
                vim.cmd('startinsert')
                return
            end

            if saved_mode ~= 'n' then
                local current_mode = vim.fn.mode()
                if current_mode == 'n' then
                    vim.cmd('startinsert')
                    return
                end
            end
        end,
    }
)

vim.api.nvim_create_autocmd(
    { 'TextYankPost' },
    {
        callback = function()
            vim.highlight.on_yank()
        end,
    }
)

vim.api.nvim_create_autocmd(
    { 'LspAttach' },
    {
        callback = function(args)
            local bufnr = args.buf
            local client_id = args.data.client_id
            local client = vim.lsp.get_client_by_id(client_id)
            if client.supports_method('textDocument/semanticTokens/full') then
                vim.lsp.semantic_tokens.start(bufnr, client_id)
            end
        end,
    }
)

-- vim.api.nvim_create_autocmd(
--     { 'LspAttach' },
--     {
--         callback = function(args)
--             if args.filetype == 'NvimTree' or args.filetype == 'NeogitCommitMessage' then
--                 return
--             end
--             vim.api.nvim_set_option('updatetime', 1000)
--             vim.api.nvim_create_autocmd(
--                 { 'CursorHold', 'CursorHoldI' },
--                 {
--                     callback = function(args)
--                         vim.diagnostic.open_float(nil, { focus = false })
--                     end,
--                 }
--             )
--         end,
--     }
-- )

vim.api.nvim_create_autocmd(
    { 'TextChangedI', 'TextChangedP' },
    {
        callback = function()
            vim.api.nvim_input('<C-g>u')
        end,
        pattern = '*',
    }
)

vim.filetype.add({
    extension = { codon = 'codon', mojo = 'mojo' },
})

vim.api.nvim_create_autocmd(
    'FileType',
    {
        pattern = { 'codon', 'mojo' },
        callback = function()
            vim.bo.filetype = 'python'
        end,
    }
)

-- https://github.com/ethanholz/nvim-lastplace
-- https://github.com/neovim/neovim/issues/16339
-- https://www.reddit.com/r/neovim/comments/1052d98/how_to_save_last_position_in_files/
local ignore_buftype = {
    'quickfix',
    'nofile',
    'help',
}

local ignore_filetype = {
    'gitcommit',
    'gitrebase',
    'svn',
    'hgcommit',
}

local last_cursor_position = vim.api.nvim_create_augroup('LastCursorPosition', { clear = true })
vim.api.nvim_create_autocmd('BufWinEnter', {
    group = last_cursor_position,
    pattern = { '*' },
    desc = 'Restore last cursor position',
    callback = function()
        if vim.tbl_contains(ignore_buftype, vim.bo.buftype) then
            return
        end
        if vim.tbl_contains(ignore_filetype, vim.bo.filetype) then
            vim.cmd [[normal! gg]]
            return
        end
        if vim.fn.line('.') > 1 then
            return
        end
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
