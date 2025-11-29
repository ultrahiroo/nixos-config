vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.smartindent = true

-- default
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- https://qiita.com/321shoot/items/bf25a5312cd98e3bfe4f
local filetype_tab_size = {
  lua = 2,
  markdown = 2,
  python = 4,
  typescript = 2,
  javascript = 2,
  nix = 2,
}
local user_filetype_config = vim.api.nvim_create_augroup(
  'UserFileTypeConfig', { clear = true }
)
vim.api.nvim_create_autocmd(
  { 'FileType' },
  {
    group = user_filetype_config,
    callback = function(args)
      local ftts = filetype_tab_size[args.match]
      if ftts then
        vim.bo.tabstop = ftts
        vim.bo.shiftwidth = ftts
      end
    end
  }
)
