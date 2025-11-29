local function set_saved_mode(buf, mode)
  vim.b[buf].current_mode = mode
end

local function get_saved_mode(buf)
  return vim.b[buf].current_mode
end

local function set_initial_mode(buf)
  local filetype = vim.bo.filetype
  local buftype = vim.bo.buftype
  if false then
    vim.notify('filetype: ' .. filetype .. ', buftype: ' .. buftype, 'info')
  end
  if filetype == '' then
    return
  end
  if filetype == 'qf' then
    return
  end
  if filetype == 'NvimTree' and buftype == 'nofile' then
    set_saved_mode(buf, 'n')
  end
  if buftype == '' then
    set_saved_mode(buf, 'i')
  end
end

local function change_mode(current_mode, saved_mode)
  if current_mode == 'n' and saved_mode == 'i' then
    vim.cmd('startinsert')
  end
  if current_mode == 't' and saved_mode == 'i' then
    vim.api.nvim_input('i') -- vim.cmd('startinsert') does not work
  end
  if current_mode == 'i' and saved_mode == 'n' then
    vim.cmd('stopinsert')
  end
end

local function set_saved_column(buf, column)
  vim.b[buf].saved_column = column
end

local function get_saved_column(buf)
  return vim.b[buf].saved_column
end

local function save_column(buf)
  local _, _, col, off, _ = unpack(vim.fn.getcurpos('.'))
  local cursor_x = col + off
  set_saved_column(buf, cursor_x)
end

vim.api.nvim_create_autocmd(
  { 'CursorMoved', 'CursorMovedI' },
  {
    callback = function(args)
      save_column(args.buf)
    end,
  }
)

vim.api.nvim_create_autocmd(
  { 'ModeChanged' },
  {
    callback = function(args)
      if false then
        vim.notify('args.match: ' .. args.match, 'info')
      end

      local request_save_mode = vim.b[args.buf].request_save_mode
      if (request_save_mode == nil or request_save_mode == true) then
        vim.b[args.buf].current_mode = vim.fn.mode()
        vim.b[args.buf].request_save_mode = false
      end

      -- local request_change_mode = vim.b[args.buf].request_change_mode
      -- if (request_change_mode == nil or request_change_mode == true) then
      --   local saved_mode = vim.b[args.buf].current_mode
      --   local current_mode = vim.fn.mode()
      --   change_mode(current_mode, saved_mode)
      --   if false then
      --     vim.notify(
      --       'changed mode'
      --       .. ', current_mode: ' .. current_mode
      --       .. ', saved_mode: ' .. saved_mode,
      --       'info'
      --     )
      --   end
      --   vim.b[args.buf].request_change_mode = false
      -- end

      if args.match == 'n:i' then
        local _, lnum, col, off, _ = unpack(vim.fn.getcurpos('.'))
        local cursor_x = col + off
        local cursor_y = lnum
        vim.api.nvim_win_set_cursor(0, { cursor_y, cursor_x - 1 })
      elseif args.match == 'i:n' then
        local saved_column = get_saved_column(args.buf)
        if saved_column ~= 1 then
          local _, lnum, col, off, _ = unpack(vim.fn.getcurpos('.'))
          local cursor_x = col + off
          local cursor_y = lnum
          vim.api.nvim_win_set_cursor(0, { cursor_y, cursor_x })
        end
      elseif args.match == 't:nt' then
        local _, lnum, col, off, _ = unpack(vim.fn.getcurpos('.'))
        local cursor_x = col + off
        local cursor_y = lnum
        vim.api.nvim_win_set_cursor(0, { cursor_y, cursor_x })
      elseif args.match == 'i:nt' then
        local _, lnum, col, off, _ = unpack(vim.fn.getcurpos('.'))
        local cursor_x = col + off
        local cursor_y = lnum
        vim.api.nvim_win_set_cursor(0, { cursor_y, cursor_x })
      end
    end,
  }
)

vim.api.nvim_create_autocmd(
  { 'BufEnter' },
  {
    callback = function(args)
      local saved_mode = get_saved_mode(args.buf)
      if saved_mode == nil then
        set_initial_mode(args.buf)
      end
      saved_mode = get_saved_mode(args.buf)
      if saved_mode == nil then
        return
      end

      local current_mode = vim.fn.mode()
      if false then
        vim.notify(
          'current_mode: ' .. current_mode .. ', saved_mode: ' .. saved_mode, 'info'
        )
      end
      change_mode(current_mode, saved_mode)
    end,
  }
)
