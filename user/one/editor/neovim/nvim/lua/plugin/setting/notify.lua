return {
    'rcarriga/nvim-notify',
    lazy = true,
    config = function()
        vim.notify = require('notify')
    end,
    event = {
        'VimEnter',
        'LspAttach',
    },
}
