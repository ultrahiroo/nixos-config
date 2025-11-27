local function config()
    require('nvim-surround').setup({
    })
end

return {
    'kylechui/nvim-surround',
    config = config,
    event = 'VeryLazy',
}
