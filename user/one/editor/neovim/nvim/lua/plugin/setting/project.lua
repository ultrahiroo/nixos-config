return {
    'ahmedkhalf/project.nvim',
    lazy = true,
    config = function()
        require('project_nvim').setup({
            manual_mode = false,
        })
    end,
    event = { 'BufRead', 'BufNewFile' },
}
