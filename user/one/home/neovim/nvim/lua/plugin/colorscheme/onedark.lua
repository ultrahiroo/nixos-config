local function config()
    -- vim.cmd('colorscheme onedark')
    require('onedark').setup {
        -- style = 'dark',
        -- style = 'darker',
        -- style = 'cool',
        style = 'deep',
        -- style = 'warm',
        -- style = 'warmer',
    }
    require('onedark').load()
end

return {
    'navarasu/onedark.nvim',
    lazy = false,
    enabled = true,
    config = config,
    priority = 1000,
}
