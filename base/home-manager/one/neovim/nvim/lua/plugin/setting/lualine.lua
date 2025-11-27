local get_hl = vim.api.nvim_get_hl --- @type function
-- local get_hl_by_name = vim.api.nvim_get_hl_by_name --- @type function
-- local hlexists = vim.fn.hlexists --- @type function

-- local tbl = require('barbar.utils.table')
-- local hl_groups_cache = {}
hl_groups_cache = {}

-- local get_hl_util = get_hl and
--   function(name) return get_hl(0, {link = false, name = name}) end or
--   function(name)
--     if hlexists(name) < 1 then
--       return {}
--     end

--     local definition = get_hl_by_name(name, true)
--     for original, new in pairs {background = 'bg', foreground = 'fg', special = 'sp'} do
--       local attribute_definition = tbl.remove_key(definition, original)
--       if attribute_definition then
--         definition[new] = attribute_definition
--       end
--     end

--     local cterm = get_hl_by_name(name, false)
--     definition.ctermfg = cterm.foreground
--     definition.ctermbg = cterm.background

--     return definition
--   end

local get_hl_util = get_hl and function(name) return get_hl(0, {link = false, name = name}) end

--- @param group string the groups to source the color from.
--- @return table
local function get_hl_cached(group)
  do
    local hl_cached = hl_groups_cache[group]
    if hl_cached then
      return hl_cached
    end
  end

  local hl = get_hl_util(group)
  hl_groups_cache[group] = hl
  return hl
end

local function get_hl_color_or_default(groups, attribute, default)
  for _, group in ipairs(groups) do
    local hl_attribute = get_hl_cached(group)[attribute]
    if hl_attribute then
      return hl_attribute
    end
  end

  return default
end

local hl = {}
function hl.bg_or_default(groups, default, default_cterm)
  return {
    cterm = get_hl_color_or_default(groups, 'ctermbg', default_cterm or default),
    gui = get_hl_color_or_default(groups, 'bg', default),
  }
end

local tabpage_hl = {'TabLineFill', 'StatusLine'}
bg_tabline = hl.bg_or_default(tabpage_hl, 'none')


-- From https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua
default_colors = {
    -- bg       = '#202328',
    bg       = '#ffffff',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}
-- local _colors = {
--     bg = "#24283b",
--     bg_dark = "#1f2335",
--     bg_highlight = "#292e42",
--     blue = "#7aa2f7",
--     blue0 = "#3d59a1",
--     blue1 = "#2ac3de",
--     blue2 = "#0db9d7",
--     blue5 = "#89ddff",
--     blue6 = "#b4f9f8",
--     blue7 = "#394b70",
--     comment = "#565f89",
--     cyan = "#7dcfff",
--     dark3 = "#545c7e",
--     dark5 = "#737aa2",
--     fg = "#c0caf5",
--     fg_dark = "#a9b1d6",
--     fg_gutter = "#3b4261",
--     git = {
--         add = "#449dab",
--         change = "#6183bb",
--         delete = "#914c54"
--     },
--     gitSigns = {
--         add = "#266d6a",
--         change = "#536c9e",
--         delete = "#b2555b"
--     },
--     green = "#9ece6a",
--     green1 = "#73daca",
--     green2 = "#41a6b5",
--     magenta = "#bb9af7",
--     magenta2 = "#ff007c",
--     none = "NONE",
--     orange = "#ff9e64",
--     purple = "#9d7cd8",
--     red = "#f7768e",
--     red1 = "#db4b4b",
--     teal = "#1abc9c",
--     terminal_black = "#414868",
--     yellow = "#e0af68"
-- }

-- local default_colors = {
--     bg       = vim.g.terminal_color_0,
--     red      = vim.g.terminal_color_1,
--     green    = vim.g.terminal_color_2,
--     yellow   = vim.g.terminal_color_3,
--     darkblue = vim.g.terminal_color_4,
--     violet   = vim.g.terminal_color_5,
--     cyan     = vim.g.terminal_color_6,
--     fg       = vim.g.terminal_color_7,
--     orange   = vim.g.terminal_color_9,
--     blue     = vim.g.terminal_color_12,
--     magenta  = vim.g.terminal_color_13,
-- }
-- vim.g.terminal_color_0 = c.black
-- vim.g.terminal_color_1 = c.red
-- vim.g.terminal_color_2 = c.green
-- vim.g.terminal_color_3 = c.yellow
-- vim.g.terminal_color_4 = c.blue
-- vim.g.terminal_color_5 = c.purple
-- vim.g.terminal_color_6 = c.cyan
-- vim.g.terminal_color_7 = c.fg
-- vim.g.terminal_color_8 = c.grey
-- vim.g.terminal_color_9 = c.red
-- vim.g.terminal_color_10 = c.green
-- vim.g.terminal_color_11 = c.yellow
-- vim.g.terminal_color_12 = c.blue
-- vim.g.terminal_color_13 = c.purple
-- vim.g.terminal_color_14 = c.cyan
-- vim.g.terminal_color_15 = c.fg

local function get_colors()
    -- local name = 'Normal'
    local name = 'TabLine'
    -- local name = 'StatusLine'
    -- local name = 'TabLineFill'
    -- local name = 'MsgArea'
    -- local name = 'FloatTitle'
    -- local color = vim.api.nvim_get_hl_by_name(name, true)
    local color = vim.api.nvim_get_hl(0, {link = false, name = name})
    local bg = '#' .. string.format('%06x', bg_tabline.gui)
    -- local bg = '#' .. string.format('%06x', color.bg)
    -- local fg = '#' .. string.format('%06x', color.fg)
    -- local bg = '#' .. string.format('%06x', bg_tabline.gui)
    -- local bg = '#' .. string.format('%06x', color.background)
    -- local fg = '#' .. string.format('%06x', color.foreground)
    -- local bg = '#' .. string.format('%06x', hl.bg)
    -- local fg = '#' .. string.format('%06x', hl.fg)
    default_colors.bg = bg
    default_colors.fg = fg
    return default_colors
end

--     local colors_name = vim.g.colors_name
--     if colors_name == nil then
--         -- return {
--         --     bg       = '#202328',
--         --     fg       = '#bbc2cf',
--         --     yellow   = '#ECBE7B',
--         --     cyan     = '#008080',
--         --     darkblue = '#081633',
--         --     green    = '#98be65',
--         --     orange   = '#FF8800',
--         --     violet   = '#a9a1e1',
--         --     magenta  = '#c678dd',
--         --     blue     = '#51afef',
--         --     red      = '#ec5f67',
--         -- }
--         return {
--             bg       = vim.g.terminal_color_0,
--             red      = vim.g.terminal_color_1,
--             green    = vim.g.terminal_color_2,
--             yellow   = vim.g.terminal_color_3,
--             darkblue = vim.g.terminal_color_4,
--             violet   = vim.g.terminal_color_5,
--             cyan     = vim.g.terminal_color_6,
--             fg       = vim.g.terminal_color_7,
--             orange   = vim.g.terminal_color_9,
--             blue     = vim.g.terminal_color_12,
--             magenta  = vim.g.terminal_color_13,
--         }
--     else
--         -- local colors = require(colors_name .. '.colors').default
--         -- local colors = require(colors_name .. '.colors')
--         return {
--             bg       = vim.g.terminal_color_0,
--             red      = vim.g.terminal_color_1,
--             green    = vim.g.terminal_color_2,
--             yellow   = vim.g.terminal_color_3,
--             darkblue = vim.g.terminal_color_4,
--             violet   = vim.g.terminal_color_5,
--             cyan     = vim.g.terminal_color_6,
--             fg       = vim.g.terminal_color_7,
--             orange   = vim.g.terminal_color_9,
--             blue     = vim.g.terminal_color_12,
--             magenta  = vim.g.terminal_color_13,
--         }
--     end
-- end

local function config()
    local colors = get_colors()
    local conditions = {
        buffer_not_empty = function()
            return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
        end,
        hide_in_width = function()
            return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
            local filepath = vim.fn.expand('%:p:h')
            local gitdir = vim.fn.finddir('.git', filepath .. ';')
            return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
    }

    local opts = {
        options = {
            icons_enabled = false,
            component_separators = '',
            section_separators = '',
            theme = {
                normal = { c = { fg = colors.fg, bg = colors.bg } },
                inactive = { c = { fg = colors.fg, bg = colors.bg } },
            },
        },
        sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_y = {},
            lualine_z = {},
            lualine_c = {},
            lualine_x = {},
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_y = {},
            lualine_z = {},
            lualine_c = {},
            lualine_x = {},
        },
    }

    local function ins_left(component)
        table.insert(opts.sections.lualine_c, component)
    end

    local function ins_right(component)
        table.insert(opts.sections.lualine_x, component)
    end

    ins_left {
        function()
            local mode_string = {
                n = 'Normal',
                i = 'Insert',
                v = 'v',
                [''] = '',
                V = 'V',
                c = 'c',
                no = 'no',
                s = 'Select',
                S = 'S',
                [''] = '',
                ic = 'ic',
                R = 'Replace',
                Rv = 'Rv',
                cv = 'cv',
                ce = 'ce',
                r = 'r',
                rm = 'rm',
                ['r?'] = 'r?',
                ['!'] = '!',
                t = 't',
            }
            return mode_string[vim.fn.mode()]
        end,
        color = function()
            local mode_color = {
                n = colors.red,
                i = colors.green,
                v = colors.blue,
                [''] = colors.blue,
                V = colors.blue,
                c = colors.magenta,
                no = colors.red,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.violet,
                Rv = colors.violet,
                cv = colors.red,
                ce = colors.red,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.red,
                t = colors.red,
            }
            return {
                -- fg = mode_color[vim.fn.mode()],
                fg = colors.red,
                bg = colors.bg,
                gui = 'bold',
            }
        end,
        padding = { left = 1, right = 1 },
    }

    ins_left {
        'filename',
        cond = conditions.buffer_not_empty,
        color = { fg = colors.magenta, gui = 'bold' },
    }

    ins_left {
        'branch',
        icons_enabled = false,
        color = { fg = colors.violet, gui = 'bold' },
    }

    ins_left {
        'diff',
        symbols = { added = '+ ', modified = '~', removed = '-' },
        diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.orange },
            removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
        icons_enabled = false,
    }

    ins_left {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = {
            error = 'E:',
            warn  = 'W:',
            info  = 'I:',
            hint  = 'H:',
        },
        diagnostics_color = {
            color_error = { fg = colors.red },
            color_warn  = { fg = colors.yellow },
            color_info  = { fg = colors.cyan },
            color_hint  = { fg = colors.magenta },
        },
        icons_enabled = false,
        always_visible = false,
    }

    ins_left { 'location' }

    ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

    ins_left {
        function()
            return '%='
        end,
    }

    ins_right {
        function()
            local msg = ''
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            local clients = vim.lsp.get_clients()
            if next(clients) == nil then
                return msg
            end
            for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    if client.name == 'null-ls' then
                        return msg
                    end
                    return client.name
                end
            end
            return msg
        end,
        icons_enabled = false,
        color = { fg = colors.fg },
    }

    ins_right {
        'o:encoding',
        fmt = string.upper,
        cond = conditions.hide_in_width,
        color = { fg = colors.fg },
    }

    ins_right {
        'fileformat',
        fmt = string.upper,
        icons_enabled = false,
        color = { fg = colors.fg },
    }

    ins_right {
        'filesize',
        cond = conditions.buffer_not_empty,
    }

    require('lualine').setup(opts)
end


return {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    config = config,
    event = { 'BufAdd', 'BufNewFile', 'BufReadPost' },
}
