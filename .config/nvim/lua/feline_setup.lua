local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')
local api = vim.api

local force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {}
}

local colors = {
  bg = '#1c1c1c',
  black = '#1c1c1c',
  inactiveblack = '#363636',
  yellow = '#d8a657',
  cyan = '#89b482',
  oceanblue = '#45707a',
  deepblue = '#1a3940',
  green = '#a9b665',
  orange = '#e78a4e',
  violet = '#d3869b',
  magenta = '#c14a4a',
  white = '#a89984',
  brightwhite = '#d4c1a7',
  fg = '#a89984',
  skyblue = '#7daea3',
  red = '#ea6962',
}

local vi_mode_colors = {
  NORMAL = 'green',
  OP = 'green',
  INSERT = 'red',
  VISUAL = 'skyblue',
  LINES = 'skyblue',
  BLOCK = 'skyblue',
  REPLACE = 'violet',
  ['V-REPLACE'] = 'violet',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'green',
  SHELL = 'green',
  TERM = 'green',
  NONE = 'yellow'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'packer',
  'startify',
  'fugitive',
  'fugitiveblame',
  'coc-explorer'
}

force_inactive.buftypes = {
  'terminal'
}

local components = {
  active = {},
  inactive = {}
}

components.active[1] = {
  {
    provider = function()
      return vi_mode_utils.get_vim_mode()
    end,
    hl = function()
      return {
        name = vi_mode_utils.get_mode_highlight_name(),
        fg = vi_mode_utils.get_mode_color(),
      }
    end,
    right_sep = ' ',
    icon = ''
  },
  {
    provider = 'file_info',
    hl = {
      fg = 'brightwhite',
      bg = 'deepblue',
    },
    left_sep = '',
    right_sep = ' ',
    icon = '',
    type = 'unique'
  },
}

components.active[2] = {
    {
        provider = 'git_branch',
        hl = {
            fg = 'white',
            bg = 'black',
            style = 'bold'
        },
        right_sep = {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = 'black'
            }
        },
        icon = ' '
    },
    {
        provider = 'git_diff_added',
        hl = {
            fg = 'green',
            bg = 'black'
        },
        icon = ' +'
    },
    {
        provider = 'git_diff_changed',
        hl = {
            fg = 'orange',
            bg = 'black'
        },
        icon = ' ~'
    },
    {
        provider = 'git_diff_removed',
        hl = {
            fg = 'red',
            bg = 'black'
        },
        right_sep = {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = 'black'
            }
        },
        icon = ' -'
    },
    {
        provider = 'line_percentage',
        hl = {
            style = 'bold'
        },
        left_sep = '  ',
        right_sep = ' '
    },
    {
        provider = 'scroll_bar',
        hl = {
            fg = 'skyblue',
            style = 'bold'
        }
    }
}

components.inactive[1] = {
  {
    provider = '',
    hl = {
      fg = 'inactiveblack',
      bg = 'inactiveblack',
      style = 'underline'
    }
  },
}
components.inactive[2] = {
  {
    provider = '',
    hl = {
      fg = 'inactiveblack',
      bg = 'inactiveblack',
      style = 'underline'
    }
  },
  {
    provider = 'file_info',
    hl = {
      fg = 'white',
      bg = 'inactiveblack',
    },
    left_sep = '',
    right_sep = '',
    icon = '',
    file_readonly_icon = '',
    type = 'unique'
  },
  {
    provider = '',
    hl = {
      fg = 'inactiveblack',
      bg = 'inactiveblack',
      style = 'underline'
    }
  },
}
components.inactive[3] = {
  {
    provider = '',
    hl = {
      fg = 'inactiveblack',
      bg = 'inactiveblack',
      style = 'underline'
    }
  },
}

require('feline').setup({
  colors = colors,
  default_bg = bg,
  default_fg = fg,
  vi_mode_colors = vi_mode_colors,
  components = components,
  force_inactive = force_inactive,
})
