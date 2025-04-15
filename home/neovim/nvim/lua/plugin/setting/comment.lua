local function config()
    local nvim_comment = require('nvim_comment')

    nvim_comment.setup {
        comment_empty = false,
        create_mappings = false,
    }

    vim.keymap.set(
        { 'n', 'i' },
        '<C-k>',
        function()
            local cursor = vim.api.nvim_win_get_cursor(0)
            local cursor_y = cursor[1]
            nvim_comment.comment_toggle(cursor_y, cursor_y)
        end,
        {}
    )

    vim.keymap.set(
        { 's' },
        '<C-k>',
        function()
            local _, y_begin, x_begin, _ = unpack(vim.fn.getpos('v'))
            local _, y_end, x_end, _ = unpack(vim.fn.getpos('.'))
            if y_begin < y_end then
                if x_end == 1 then
                    y_end = y_end - 1
                end
            else
                if x_begin == 1 then
                    y_begin = y_begin - 1
                end
                y_begin, y_end = y_end, y_begin
            end
            nvim_comment.comment_toggle(y_begin, y_end)
        end,
        {}
    )
end

return {
    'terrortylor/nvim-comment',
    lazy = true,
    config = config,
    -- event = { 'CursorHold', 'CursorHoldI' },
    event = { 'BufReadPre' },
    -- keys = { '<C-k>' },
}
