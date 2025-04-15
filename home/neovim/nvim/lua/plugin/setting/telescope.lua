    -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
-- require('telescope').setup {
--     defaults = {
--         mappings = {
--             i = {
--                 ['<C-u>'] = false,
--                 ['<C-d>'] = false,
--             },
--         },
--     },
-- }
-- Enable telescope fzf native, if installed
-- pcall(require('telescope').load_extension, 'fzf')
-- -- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
-- vim.keymap.set('n', '<leader>/', function()
--     -- You can pass additional configuration to telescope to change theme, layout, etc.
--     require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--         winblend = 12,
--         previewer = false,
--     })
-- end, { desc = '[/] Fuzzily search in current buffer]' })
-- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

local enabled = false
local opts = {
    defaults = {
        layout_config = {
            horizontal = {
                preview_width = 0.55,
                results_width = 0.8,
            },
            width = 0.99,
            height = 0.99,
        },
        -- border = false,
        -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
    }
}

if enabled then
    vim.keymap.set(
        { 'n', 'i', 's', 't' },
        '<C-o>',
        function()
            vim.cmd('TelescopeFile')
        end
    )
end

local function config(_, opts)
    require('telescope').setup(opts)
    local telescope_builtin = require('telescope.builtin')
    vim.api.nvim_create_user_command(
        'TelescopeFile',
        function()
            telescope_builtin.find_files()
        end,
        {}
    )
end

return {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    enabled = enabled,
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        -- { "debugloop/telescope-undo.nvim" },
        -- {
        --     "ahmedkhalf/project.nvim",
        --     event = { "CursorHold", "CursorHoldI" },
        --     config = require("tool.project"),
        -- },
        -- { "jvgrootveld/telescope-zoxide" },
        -- { "nvim-telescope/telescope-frecency.nvim" },
        -- { "nvim-telescope/telescope-live-grep-args.nvim" },
        -- { "nvim-telescope/telescope-fzf-native.nvim",    build = "make" },
    },
    opts = opts,
    config = config,
    cmd = { 'Telescope', 'TelescopeFile' },
    -- keys = {
    --     {
    --         '<C-o>',
    --         function()
    --             require('telescope.builtin').find_files()
    --         end,
    --         desc = ''
    --     },
    -- },
}
