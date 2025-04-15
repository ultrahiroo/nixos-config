-- require('keymap.undo')

-- From https://github.com/neovim/neovim/blob/master/runtime/mswin.vim
vim.cmd([[
if has("clipboard")
    " vnoremap <C-X> "+x
    " vnoremap <S-Del> "+x
    vnoremap <C-c> "+y
    " map <C-V> "+gP
    cmap <C-V> <C-R>+
 endif
" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
" Use CTRL-G u to have CTRL-Z only undo the paste.
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']
" Use CTRL-S for saving, also in Insert mode (<C-O> doesn't work well when
" using completions).
" noremap <C-S>		:update<CR>
" vnoremap <C-S>		<C-C>:update<CR>
" inoremap <C-S>		<Esc>:update<CR>gi
" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.

if !has('unix')
    set guioptions-=a
endif
" CTRL-A is Select all
"noremap <C-A> gggH<C-O>G
"inoremap <C-A> <C-O>gg<C-O>gH<C-O>Gnoremanoremanoremap
"cnoremap <C-A> <C-C>gggH<C-O>G
"onoremap <C-A> <C-C>gggH<C-O>G
"snoremap <C-A> <C-C>gggH<C-O>G
"xnoremap <C-A> <C-C>ggVG
" CTRL-Tab is Next window
"noremap <C-Tab> <C-W>w
"inoremap <C-Tab> <C-O><C-W>w
"cnoremap <C-Tab> <C-C><C-W>w
"onoremap <C-Tab> <C-C><C-W>w
]])

-- vim.keymap.set({ 'n', 'i' }, '<C-t><C-v>', '<C-\\><C-n>:split | wincmd j | resize 20 | terminal<CR>')
-- vim.keymap.set({ 'n', 'i', 's', 't' }, '<C-w>', '<C-\\><C-n><C-w>wgi', { silent = true })

local keymap = {}
function keymap.set(lhs, rhs, mode, opts)
    -- https://neovim.io/doc/user/map.html#map-overview
    -- https://neovim.io/doc/user/builtin.html#mode()
    mode = mode or {
        'n', -- Normal
        'i', -- Insert, Replace
        'c', -- Command-line
        'x', -- Visual
        's', -- Select
        'o', -- Operator-pending
        't', -- Terminal
    }
    opts = opts or {}
    if opts.noremap == nil then
        opts.noremap = true
    end
    if opts.silent == nil then
        opts.silent = true
    end
    -- https://github.com/neovim/neovim/pull/16594
    vim.keymap.set(mode, lhs, rhs, opts)
end

local function smode_to_cmode()
    vim.api.nvim_input('<C-g>:<BS><BS><BS><BS><BS>')
end

local function smode_to_xmode()
    vim.api.nvim_input('<C-g>')
end

-- ISSUE
-- https://github.com/vim/vim/pull/11579
-- https://github.com/neovim/neovim/pull/21115
local function get_visual_selection()
    local _, begin_y, begin_x = unpack(vim.fn.getpos('v'))
    local _, end_y, end_x = unpack(vim.fn.getpos('.'))
    if begin_y > end_y or ((begin_y == end_y) and begin_x > end_x) then
        local begin_y_old = begin_y
        local begin_x_old = begin_x
        begin_y = end_y
        begin_x = end_x
        end_y = begin_y_old
        end_x = begin_x_old
    end
    return vim.api.nvim_buf_get_text(0, begin_y - 1, begin_x - 1, end_y - 1, end_x - 1, {})[1]
end

local function save_mode()
    local buf = vim.api.nvim_get_current_buf()
    vim.b[buf].current_mode = vim.fn.mode()
    -- vim.notify(vim.b[buf].current_mode)
    -- vim.b.current_mode = vim.fn.mode()
end

local function request_save_mode()
    local buf = vim.api.nvim_get_current_buf()
    vim.b[buf].request_save_mode = true
end

local function start_insert()
    vim.cmd('startinsert')
    local cursor_y = vim.fn.line('.')
    local cursor_x = vim.fn.virtcol('.') - 1
    vim.api.nvim_win_set_cursor(0, { cursor_y, cursor_x })
end

local function stop_insert()
    local cursor_x = vim.fn.virtcol('.')
    if cursor_x == 0 then
        vim.cmd('stopinsert')
    else
        local cursor_y = vim.fn.line('.')
        vim.cmd('stopinsert')
        vim.api.nvim_win_set_cursor(0, { cursor_y, cursor_x })
    end
end

local function indent_end_x()
    local line = vim.api.nvim_get_current_line()
    if string.sub(line, 1, 1) ~= ' ' then
        return 0
    end
    -- https://www.lua.org/manual/5.4/manual.html#string.find
    -- https://www.lua.org/manual/5.4/manual.html#6.4.1
    return string.find(line, '%f[^ ]') - 1
end

local function page_movement_size()
    local height = vim.api.nvim_win_get_height(0)
    if height % 2 == 0 then
        return height / 2
    else
        return (height - 1) / 2
    end
end

-- keymap.set('<Up>', function()
--     vim.cmd('normal k')
-- end, { 'i' })

-- keymap.set('<Down>', function()
--     vim.cmd('normal j')
-- end, { 'i' })

-- vim.keymap.set({ 'n', 'i' }, '<C-a>', '<C-\\><C-n>gg0vG$<C-g>')
keymap.set('<C-a>', function()
    vim.api.nvim_input('<C-\\><C-n>gg0vG$<C-g>')
end, { 'n', 'i' })

keymap.set('<CR>', function()
    vim.api.nvim_input('i<CR>')
end, { 'n' })

keymap.set('<Esc>', function()
    start_insert()
    request_save_mode()
end, { 'n' })

keymap.set('<Esc>', function()
    stop_insert()
    request_save_mode()
end, { 'i', 't' })

keymap.set('<C-w>', function()
    -- vim.cmd('confirm bdelete | silent! only')
    vim.cmd('bdelete')
    -- vim.cmd('BufferClose')
end, { 'n', 'i', 's', 't' })

keymap.set('<C-w>', function()
    vim.cmd('confirm bdelete | silent! only')
end, { 't' })

keymap.set('<C-q>', function()
    vim.cmd('confirm quitall')
end, { 'n', 'i', 's', 't' })

keymap.set('<C-f>', function()
    vim.api.nvim_input('/')
end, { 'n' })

keymap.set('<C-f>', function()
    stop_insert()
    vim.api.nvim_input('/')
end, { 'i' })

keymap.set('<C-f>', function()
    local string_selection = get_visual_selection()
    vim.api.nvim_input('<C-\\><C-n>/' .. string_selection)
end, { 's' })

keymap.set('<C-y>', function()
    vim.cmd('redo')
end, { 'n', 'i' })

keymap.set('<C-r>', function()
    vim.cmd('source')
end, { 'n', 'i' })

keymap.set('<C-d>', function()
    vim.cmd('copy .')
end, { 'n', 'i' })

-- keymap.set('<C-t>', function()
-- end, { 'n', 'i', 'c', 'x', 's', 'o', 't' })

local function terminal()
    vim.cmd('enew | terminal')
    vim.opt_local.number = false
    vim.cmd('startinsert')
end

vim.api.nvim_create_user_command(
    'Terminal',
    function()
        terminal()
    end,
    {}
)

-- keymap.set('<C-t>', function()
--     Terminal()
--     -- vim.cmd('sleep 1 | startinsert')
-- end, { 'n', 'i' })

keymap.set('<C-e>', function()
    vim.api.nvim_input(':')
end, { 'n' })

keymap.set('<C-e>', function()
    stop_insert()
    vim.api.nvim_input(':')
end, { 'i', 't' })

keymap.set('<C-e>', function()
    smode_to_cmode()
end, { 's' })

-- keymap.set('<C-o>', function()
--     vim.api.nvim_input(':badd ')
-- end, { 'n' })

-- keymap.set('<C-o>', function()
--     stop_insert()
--     vim.api.nvim_input(':badd ')
-- end, { 'i', 't' })

-- keymap.set('<C-o>', function()
--     smode_to_cmode()
--     vim.api.nvim_input('badd ')
-- end, { 's' })


keymap.set('<C-p>', function()
    vim.cmd('wincmd w')
end, { 'n', 'i', 's', 't' })

keymap.set('<C-z>', function()
    vim.cmd('undo')
end, { 'n', 'i', 's' })

keymap.set('<C-z>', function()
end, { 'c', 'x', 'o', 't' })

keymap.set('<C-x>', function()
    vim.cmd('delete')
end, { 'n', 'i' })

keymap.set('<C-x>', function()
    vim.api.nvim_input('<C-g>x')
end, { 's' })

keymap.set('<C-c>', function()
    vim.cmd('yank')
end, { 'n', 'i' })

-- keymap.set('<C-c>', function()
-- vim.api.nvim_input('<C-g>ygv<C-g>')
-- end, { 's' })

keymap.set('<C-v>', function()
    vim.api.nvim_input('<C-g>P')
end, { 's' })

keymap.set('<C-v>', function()
    vim.api.nvim_input('P')
end, { 'n' })

keymap.set('<BS>', function()
    vim.api.nvim_input('"_X')
end, { 'n' })

local function is_empty_line()
    local line = vim.api.nvim_get_current_line()
    local result = string.find(line, '%f[^ ]')
    if result == nil then
        return true
    end
    return result - 1 == string.len(line)
end

-- keymap.set('<BS>', function()
--     if is_empty_line() == true then
--         vim.cmd('normal! dd')
--         return
--     end
--     vim.cmd('normal! X')
--     -- vim.cmd('delete')
--     -- vim.api.nvim_input('<BS>')
-- end, { 'i' })

keymap.set('<BS>', function()
    vim.api.nvim_input('<C-g>"_d')
end, { 's' })

keymap.set('<S-BS>', function()
end, { 'n', 'i' })

keymap.set('<Home>', function()
    local cursor_x_indent_end = indent_end_x()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local cursor_x = cursor[2]
    local cursor_y = cursor[1]
    if cursor_x == cursor_x_indent_end then
        cursor_x = 0
    else
        cursor_x = cursor_x_indent_end
    end
    vim.api.nvim_win_set_cursor(0, { cursor_y, cursor_x })
end, { 'n', 'i', })

keymap.set('<End>', function()
    local length_line = string.len(vim.api.nvim_get_current_line())
    local _, cursor_y, _, _, cursor_x = unpack(vim.fn.getcurpos('.'))
    if cursor_x == length_line + 1 then
        cursor_x = indent_end_x()
    else
        cursor_x = length_line
    end
    vim.api.nvim_win_set_cursor(0, { cursor_y, cursor_x })
end, { 'n', 'i', })

-- keymap.set('<S-Home>', function()
--     local cursor_x_indent_end = indent_end_x()
--     local cursor = vim.api.nvim_win_get_cursor(0)
--     local cursor_x = cursor[2]
--     local cursor_y = cursor[1]
--     if cursor_x == cursor_x_indent_end then
--         cursor_x = 0
--     else
--         cursor_x = cursor_x_indent_end
--     end
--     vim.api.nvim_win_set_cursor(0, { cursor_y, cursor_x })
-- end, { 's' })
-- -- keymap.set('<S-End>', function()
-- --     local length_line = string.len(vim.api.nvim_get_current_line())
-- --     local _, cursor_y, _,  _, cursor_x = unpack(vim.fn.getcurpos('.'))
-- --     -- vim.api.nvim_win_set_cursor(0, { cursor_y, cursor_x })
-- --     -- local _, cursor_y, _,  _, cursor_x = unpack(vim.fn.getcurpos('.'))
-- --     if cursor_x == length_line + 1 then
-- --         cursor_x = indent_end_x()
-- --     else
-- --         cursor_x = length_line
-- --     end
-- --     vim.api.nvim_win_set_cursor(0, { cursor_y, cursor_x })
-- -- end, { 's' })
-- vim.keymap.set({ 's' }, '<S-End>', function()
--     local length_line = string.len(vim.api.nvim_get_current_line())
--     local _, cursor_y, _,  _, cursor_x = unpack(vim.fn.getcurpos('.'))
--     -- vim.api.nvim_win_set_cursor(0, { cursor_y, cursor_x })
--     -- local _, cursor_y, _,  _, cursor_x = unpack(vim.fn.getcurpos('.'))
--     if cursor_x == length_line + 1 then
--         cursor_x = indent_end_x()
--     else
--         cursor_x = length_line
--     end
--     vim.api.nvim_win_set_cursor(0, { cursor_y, cursor_x })
-- end, {})
keymap.set('<PageDown>', function()
    for i = 1, page_movement_size() do
        vim.cmd('normal j')
    end
end, { 'n', 'i' })

keymap.set('<PageUp>', function()
    for i = 1, page_movement_size() do
        vim.cmd('normal k')
    end
end, { 'n', 'i' })

keymap.set('<Del>', function()
    vim.api.nvim_input('"_x')
end, { 'n' })

keymap.set('<Del>', function()
    vim.api.nvim_input('<C-g>"_d')
end, { 's' })

keymap.set('<Tab>', function()
    -- vim.api.nvim_input('<C-g>:><CR><CR>')
end, { 's' })

keymap.set('<S-Tab>', function()
    -- vim.api.nvim_input('<C-g>:<')
end, { 's' })

-- vim.cmd([[
-- " highlight ColorColumn ctermbg=None ctermfg=Red guibg=None guifg=Red" call matchadd('ColorColumn', '\%129v.\+', 100)
-- " call matchadd('ColorColumn', '\%129v.\+', 100)
-- " highlight ColorSpace ctermbg=Red ctermfg=Red guibg=Red guifg=Red
-- " call matchadd('ColorSpace', ' \+$', 100)
-- " call clearmatches()
-- ]])

--]]

-- vim.api.nvim_create_user_command(
--     'StartInsert',
--     function()
--         StartInsert()
--     end,
--     {}
-- )

-- vim.api.nvim_create_user_command(
--     'StopInsert',
--     function()
--         StopInsert()
--     end,
--     {}
-- )

local function update()
    local line_count = vim.api.nvim_buf_line_count(0)
    if line_count == 1 then
        local buffer = vim.api.nvim_buf_get_lines(0, 0, 1, true)
        if buffer[1] == '' then
            vim.api.nvim_buf_set_lines(0, 0, 1, true, {})
        end
    end
    vim.cmd('update')
end

vim.api.nvim_create_user_command(
    'Update',
    function()
        update()
    end,
    {}
)

keymap.set('<C-s>', function()
    update()
end, { 'n', 'i', 's' })

-- local function decrease_indent(y1, y2)
--     vim.cmd(tostring(y1) .. ',' .. tostring(y2) .. '<')
-- end

-- local function increase_indent(y1, y2)
--     vim.cmd(tostring(y1) .. ',' .. tostring(y2) .. '>')
-- end

-- local function get_y1_y2()
--     local _, y_begin, x_begin, _ = unpack(vim.fn.getpos('v'))
--     local _, y_end, x_end, _ = unpack(vim.fn.getpos('.'))
--     if y_begin < y_end then
--         if x_end == 1 then
--             y_end = y_end - 1
--         end
--     else
--         if x_begin == 1 then
--             y_begin = y_begin - 1
--         end
--         y_begin, y_end = y_end, y_begin
--     end
--     return y_begin, y_end
-- end

-- keymap.set('<C-Left>', function()
--     local y1, y2 = get_y1_y2()
--     decrease_indent(y1, y2)
--     vim.g.y1, vim.g.y2 = y1, y2
-- end, { 's' })

-- keymap.set('<C-Right>', function()
--     local y1, y2 = get_y1_y2()
--     increase_indent(y1, y2)
--     vim.g.y1, vim.g.y2 = y1, y2
-- end, { 's' })

-- keymap.set('<C-Left>', function()
--     local y1, y2 = vim.g.y1, vim.g.y2
--     if y1 ~= nil and y2 ~= nil then
--         decrease_indent(y1, y2)
--     end
-- end, { 'i' })

-- keymap.set('<C-Right>', function()
--     local y1, y2 = vim.g.y1, vim.g.y2
--     if y1 ~= nil and y2 ~= nil then
--         increase_indent(y1, y2)
--     end
-- end, { 'i' })

local function decrease_indent(y1, y2)
    vim.cmd('silent' .. tostring(y1) .. ',' .. tostring(y2) .. '<')
end

local function increase_indent(y1, y2)
    vim.cmd('silent' .. tostring(y1) .. ',' .. tostring(y2) .. '>')
end

local function get_begin_end_xy()
    local begin_x = vim.fn.virtcol('v')
    local begin_y = vim.fn.line('v')
    local end_x = vim.fn.virtcol('.')
    local end_y = vim.fn.line('.')
    return begin_x, begin_y, end_x, end_y
end

local function get_y1_y2(begin_x, begin_y, end_x, end_y)
    if begin_y < end_y then
        if end_x == 1 then
            end_y = end_y - 1
        end
    else
        if begin_x == 1 then
            begin_y = begin_y - 1
        end
        begin_y, end_y = end_y, begin_y
    end
    return begin_y, end_y
end

local function select_mode(begin_x, begin_y, end_x, end_y)
    vim.api.nvim_win_set_cursor(0, { begin_y, begin_x })
    vim.cmd('normal gh')
    vim.api.nvim_win_set_cursor(0, { end_y, end_x })
end

keymap.set('<C-Left>', function()
    local begin_x, begin_y, end_x, end_y = get_begin_end_xy()
    local y1, y2 = get_y1_y2(begin_x, begin_y, end_x, end_y)
    decrease_indent(y1, y2)
    select_mode(begin_x - 1, begin_y, end_x - 1, end_y)
end, { 's' })

keymap.set('<C-Right>', function()
    local begin_x, begin_y, end_x, end_y = get_begin_end_xy()
    local y1, y2 = get_y1_y2(begin_x, begin_y, end_x, end_y)
    increase_indent(y1, y2)
    select_mode(begin_x - 1, begin_y, end_x - 1, end_y)
end, { 's' })

require('keymap.motion')
