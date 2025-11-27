local function config()
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    cmp.setup {
        completion = {
            autocomplete = false,
        },
        window = {
            completion    = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = {
            ['<Esc>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.abort()
                else
                    fallback()
                end
            end, { 'i' }),
            ['<CR>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.confirm()
                    fallback()
                else
                    fallback()
                end
            end, { 'i' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { 'i' }),
            ['<Down>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.close()
                    fallback()
                else
                    fallback()
                end
            end, { 'i' }),
            ['<Up>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.close()
                    fallback()
                else
                    fallback()
                end
            end, { 'i' }),
            ['<Left>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.close()
                    fallback()
                else
                    fallback()
                end
            end, { 'i' }),
            ['<Right>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.close()
                    fallback()
                else
                    fallback()
                end
            end, { 'i' }),
        },
        formatting = {
            format = lspkind.cmp_format {
                with_text = true,
                menu = {
                    -- cmp_tabnine = '[Tabnine]',
                    buffer      = '[Buffer]',
                    cmdline     = '[Cmdline]',
                    nvim_lsp    = '[Lsp]',
                    path        = '[Path]',
                },
            },
        },
        sources = {
            { name = 'nvim_lsp', group_index = 1 },
            { name = 'buffer',   group_index = 2 },
            { name = 'cmdline',  group_index = 3 },
            { name = 'path',     group_index = 3 },
            -- { name = 'cmp_tabnine', group_index = 2 },
        }
    }

    local completion = {}
    function completion.open()
        if not cmp.visible() then
            cmp.complete()
        end
    end
    function completion.close()
        if cmp.visible() then
            cmp.close()
        end
    end
    local function indent_space()
        local cursor = vim.api.nvim_win_get_cursor(0)
        local cursor_x = cursor[2]
        if cursor_x == 0 then
            return true
        end
        local line = vim.api.nvim_get_current_line()
        local line_previous = string.sub(line, 1, cursor_x)
        if string.match(line_previous, '^ +$') then
            return true
        end
        return false
    end
    vim.keymap.set({ 'i' }, '<Tab>', function()
        if indent_space() then
            vim.api.nvim_input('    ')
            return
        else
            if not cmp.visible() then
                completion.open()
                return
            else
                cmp.select_next_item()
                return
            end
        end
    end, {})

    -- https://github.com/hrsh7th/nvim-cmp/issues/519#issuecomment-1091109258
    -- vim.api.nvim_create_autocmd(
    --     { 'TextChangedI', 'TextChangedP' },
    --     {
    --         callback = function()
    --             if not cmp.visible() then
    --                 return
    --             end
    --             local line = vim.api.nvim_get_current_line()
    --             local cursor = vim.api.nvim_win_get_cursor(0)[2]
    --             local current = string.sub(line, cursor, cursor + 1)
    --             if (
    --                 -- current == ''  or
    --                 current == '.' or
    --                 current == ',' or
    --                 current == ' ' or
    --                 current == '\n'
    --             ) then
    --                 completion.close()
    --             end
    --         end,
    --         pattern = '*',
    --     }
    -- )
end

return {
    'hrsh7th/nvim-cmp',
    lazy = true,
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-path',
        'onsails/lspkind.nvim',
    },
    config = config,
    event = { 'InsertEnter' },
}
