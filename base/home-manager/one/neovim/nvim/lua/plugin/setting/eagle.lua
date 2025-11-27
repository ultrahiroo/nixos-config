return {
    'soulis-1256/eagle.nvim',
    enabled = true,
    lazy = true,
    opts = {
        mouse_mode = false,
        keyboard_mode = true,
        border = 'rounded',
    },
    config = function(_, opts)
        require('eagle').setup(opts)

        local util = require('eagle.util')
        local config = require('eagle.config')
        local function render_keyboard_mode()
            if (
                util.eagle_win
                and vim.api.nvim_win_is_valid(util.eagle_win)
                and vim.api.nvim_get_current_win() ~= util.eagle_win
            ) then
                return
            end
            util.load_diagnostics(true)

            if config.options.show_lsp_info then
                util.load_lsp_info(true, function()
                    if #util.diagnostic_messages == 0 and #util.lsp_info == 0 then
                        return
                    end
                    util.create_eagle_win(true)
                end)
            else
                if #util.diagnostic_messages == 0 then
                    return
                end
                util.create_eagle_win(true)
            end
        end

        if true then
            vim.keymap.set(
                { 'n', 'i' },
                '<C-tab>',
                function()
                    render_keyboard_mode()
                end,
                { noremap = true, silent = true }
            )
        end

        if false then
            vim.api.nvim_create_autocmd(
                { 'LspAttach' },
                {
                    callback = function(args)
                        if args.filetype == 'NvimTree' or args.filetype == 'NeogitCommitMessage' then
                            return
                        end
                        vim.api.nvim_set_option('updatetime', 1000)
                        vim.api.nvim_create_autocmd(
                            {
                                'CursorHold',
                                'CursorHoldI',
                            },
                            {
                                callback = function(args)
                                    render_keyboard_mode()
                                end,
                            }
                        )
                    end,
                }
            )
        end

        vim.api.nvim_create_autocmd(
            {
                'CursorMoved',
                'CursorMovedI',
            },
            {
                callback = function(args)
                    if (
                        util.eagle_win
                        and vim.api.nvim_win_is_valid(util.eagle_win)
                    ) then
                        local force = false
                        vim.api.nvim_win_close(util.eagle_win, force)
                    end
                end,
            }
        )
    end,
    event = {
        'VimEnter',
        'LspAttach',
    },
    cmd = { 'EagleWin' },
}
