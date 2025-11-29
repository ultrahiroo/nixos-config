vim.api.nvim_create_autocmd(
  { 'VimEnter' },
  {
    callback = function()
      local original_cwd = vim.fn.getcwd()
      vim.cmd('NvimTreeOpen')
      vim.api.nvim_set_current_dir(original_cwd)
      vim.cmd('ToggleTerm')
      vim.cmd('wincmd w')
      vim.cmd('wincmd w')
    end,
  }
)

vim.api.nvim_create_autocmd(
  { 'TextChangedI', 'TextChangedP' },
  {
    callback = function()
      vim.api.nvim_input('<C-g>u')
    end,
  }
)

vim.filetype.add({
  extension = {
    codon = 'codon',
    mojo = 'mojo',
  },
})

vim.api.nvim_create_autocmd(
  { 'FileType' },
  {
    pattern = { 'codon', 'mojo' },
    callback = function()
      vim.bo.filetype = 'python'
    end,
  }
)

local ignore_buftype = {
  'quickfix',
  'nofile',
  'help',
}

local ignore_filetype = {
  'gitcommit',
  'gitrebase',
  'svn',
  'hgcommit',
}

local last_cursor_position = vim.api.nvim_create_augroup(
  'LastCursorPosition', { clear = true }
)
vim.api.nvim_create_autocmd(
  { 'BufWinEnter' },
  {
    group = last_cursor_position,
    pattern = { '*' },
    desc = 'Restore last cursor position',
    callback = function()
      if vim.tbl_contains(ignore_buftype, vim.bo.buftype) then
        return
      end
      if vim.tbl_contains(ignore_filetype, vim.bo.filetype) then
        vim.cmd [[normal! gg]]
        return
      end
      if vim.fn.line('.') > 1 then
        return
      end
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lcount = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0 and mark[1] <= lcount then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
      end
    end,
  }
)

require('autocmd.change_mode')
require('autocmd.lsp')
require('autocmd.yank')
