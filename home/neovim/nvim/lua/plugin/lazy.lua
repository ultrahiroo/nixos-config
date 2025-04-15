local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { import = 'plugin.setting' },
    { import = 'plugin.colorscheme' },
}

local opts = {
    defaults = {
        lazy = true,
    },
    lockfile = vim.fn.stdpath('state') .. '/lazy-lock.json',
}

require('lazy').setup(plugins, opts)
