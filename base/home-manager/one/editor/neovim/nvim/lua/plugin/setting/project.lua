return {
    -- 'ahmedkhalf/project.nvim',
    'Zeioth/project.nvim',  -- support Neovim >= 0.10.0
    lazy = true,
    config = function()
        require('project_nvim').setup({
            manual_mode = false,
        })
    end,
    event = { 'BufRead', 'BufNewFile' },
}
