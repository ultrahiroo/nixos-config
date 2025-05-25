return {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    enabled = false,
    config = function() vim.cmd('colorscheme catppuccin') end,
    priority = 1000,
}
