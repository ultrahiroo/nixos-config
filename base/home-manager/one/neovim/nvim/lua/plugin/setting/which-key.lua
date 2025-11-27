return {
    'folke/which-key.nvim',
    enabled = true,
    lazy = true,
    opts = {},
    config = function(_, opts)
        vim.opt.timeout = true
        vim.opt.timeoutlen = 300
        require('which-key').setup(opts)
    end,
    cmd = {
        'WhichKey',
    },
}
