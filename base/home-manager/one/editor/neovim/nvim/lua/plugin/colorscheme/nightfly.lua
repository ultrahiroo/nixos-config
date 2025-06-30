return {
    'bluz71/vim-nightfly-colors',
    name = 'nightfly',
    lazy = false,
    enabled = false,
    config = function() vim.cmd('colorscheme nightfly') end,
    priority = 1000,
}
