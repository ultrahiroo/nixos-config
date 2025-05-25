-- local function is_empty(table)
--     if table == nil then
--         return true
--     end
--     return next(table) == nil
-- end

-- keymap.set('<C-Left>', function()
--     local cursor_x = vim.fn.virtcol('.')
--     local cursor_y = vim.fn.line('.')
--     local token = vim.lsp.semantic_tokens.get_at_pos(0, cursor_y - 1, cursor_x - 2)
--     if is_empty(token) then
--         -- vim.cmd('normal h')
--         vim.cmd('normal b')
--         return
--     end
--     local begin_x = token[1].start_col
--     if cursor_x - 1 == begin_x then
--         -- vim.cmd('normal h')
--         vim.cmd('normal b')
--         return
--     end
--     vim.api.nvim_win_set_cursor(0, { token[1].line + 1, begin_x })
--     -- end, { 'n', 'i' }, { noremap = false })
-- end, { 'n', 'i' })

-- keymap.set('<C-Right>', function()
--     local cursor_x = vim.fn.virtcol('.')
--     local cursor_y = vim.fn.line('.')
--     local token = vim.lsp.semantic_tokens.get_at_pos(0, cursor_y - 1, cursor_x - 1)
--     if is_empty(token) then
--         -- vim.cmd('normal l')
--         vim.cmd('normal w')
--         return
--     end
--     local begin_x = token[1].end_col
--     if cursor_x - 1 == begin_x then
--         -- vim.cmd('normal l')
--         vim.cmd('normal w')
--         return
--     end
--     vim.api.nvim_win_set_cursor(0, { token[1].line + 1, begin_x })
-- end, { 'n', 'i' })

-- local function co_resume(co)
--     return function(err, response, ctx)
--         coroutine.resume(co, err, response, ctx)
--     end
-- end

-- -- local function lsp_selection_ranges()
-- function lsp_selection_ranges()
--     local lnum, col = unpack(vim.api.nvim_win_get_cursor(0))
--     local line = vim.api.nvim_get_current_line()
--     local bufnr = vim.api.nvim_get_current_buf()
--     local co = coroutine.running()
--     -- local nodes = {}
--     nodes = {}
--     local numSupported = 0

--     local get_clients = vim.lsp.get_clients
--     for _, client in ipairs(get_clients({ bufnr = bufnr })) do
--         if client.server_capabilities.selectionRangeProvider then
--             numSupported = numSupported + 1
--             local character = client.offset_encoding == 'utf-16' and vim.str_byteindex(line, col, true) or col
--             local params = {
--                 textDocument = {
--                     uri = vim.uri_from_bufnr(bufnr)
--                 },
--                 positions = {
--                     { line = lnum - 1, character = character }
--                 }
--             }
--             -- local function handler(err, result, ctx)
--             function handler(err, result, ctx)
--                 -- assert(not err, vim.inspect(err))
--                 -- local nodes = {}
--                 if result then
--                     local parent = result[1]
--                     while parent do
--                         local range = parent.range
--                         table.insert(nodes, {
--                             range.start.line,
--                             range.start.character,
--                             range['end'].line,
--                             range['end'].character
--                         })
--                         parent = parent.parent
--                     end
--                 end
--                 -- assert(false, vim.inspect(nodes))
--                 return nodes
--             end
--             -- local ok = client.request('textDocument/selectionRange', params, co_resume(co), bufnr)
--             local ok = client.request('textDocument/selectionRange', params, handler, bufnr)
--             -- assert(false, vim.inspect(ok))
--             assert(false, vim.inspect(nodes))
--             -- if ok then
--             --     -- local err, response, ctx = coroutine.yield()
--             --     -- assert(not err, vim.inspect(err))
--             --     assert(false, vim.inspect(nodes))
--             --     -- if response then
--             --     --     local parent = response[1]
--             --     --     while parent do
--             --     --         local range = parent.range
--             --     --         table.insert(nodes, {
--             --     --             range.start.line,
--             --     --             range.start.character,
--             --     --             range['end'].line,
--             --     --             range['end'].character
--             --     --         })
--             --     --         parent = parent.parent
--             --     --     end
--             --     -- end
--             -- end
--         end
--     end
--     assert(numSupported > 0, 'No language servers support selectionRange')
--     return nodes
-- end

vim.keymap.set(
    { 'n', 'i', 's' },
    '<CS-Up>',
    function()
    end
)

vim.keymap.set(
    { 'n', 'i', 's' },
    '<CS-Down>',
    function()
    end
)

vim.keymap.set(
    { 'n', 'i', 's' },
    '<CS-Left>',
    function()
        vim.cmd('normal h')
    end
)

vim.keymap.set(
    { 'n', 'i', 's' },
    '<CS-Right>',
    function()
        -- vim.cmd('normal l')
        local begin_x = vim.fn.virtcol('v')
        local begin_y = vim.fn.line('v')
        vim.api.nvim_win_set_cursor(0, { begin_y, begin_x })
    end
)
