local cmp = require('cmp')
local lspkind = require('lspkind')
local feedkeys = require('cmp.utils.feedkeys')
local keymap = require('cmp.utils.keymap')
local luasnip = require('luasnip')
local border_enabled = vim.g.border_enabled

local get_bufnrs = function()
  local buf = vim.api.nvim_get_current_buf()
  local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
  -- Disable buffer source for large file (1MB)
  if byte_size > 1024 * 1024 then
    return {}
  end
  return { buf }
end

local winhighlight = 'FloatBorder:SuggestWidgetBorder,CursorLine:SuggestWidgetSelect,Search:None'
if border_enabled then
  winhighlight = 'Normal:Normal,' .. winhighlight
else
  winhighlight = 'Normal:Pmenu,' .. winhighlight
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  window = {
    completion = {
      winhighlight = winhighlight,
      border = border_enabled and 'single' or 'none',
    },
    documentation = {
      winhighlight = winhighlight,
      border = border_enabled and 'single' or 'none',
      focusable = true,
    },
  },

  -- Mappings
  -- Default mappings can be found here: https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/mapping.lua
  -- Ref: https://github.com/hrsh7th/nvim-cmp/issues/1027
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<C-n>'] = {
      i = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    },
    ['<C-p>'] = {
      i = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    },
    ['<C-b>'] = {
      i = cmp.mapping.scroll_docs(-4),
    },
    ['<C-f>'] = {
      i = cmp.mapping.scroll_docs(4),
    },
    ['<C-Enter>'] = {
      i = cmp.mapping.complete(),
    },
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
    }),
    ['<CR>'] = {
      i = cmp.mapping.confirm({ select = true }),
    },
  },

  sources = cmp.config.sources({
    -- The order of the sources gives them priority, or use priority = xxx to specify it.
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    {
      name = 'buffer',
      keyword_length = 4,
      option = {
        get_bufnrs = get_bufnrs,
      },
    },
    { name = 'path' },
  }),

  formatting = {
    -- Icons
    format = lspkind.cmp_format({
      mode = "symbol",
      preset = "codicons",
      menu = ({
        buffer = "[Buf]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snip]",
        nvim_lua = "[Lua]",
        path = "[Path]",
      })
    }),
    -- Adjust the order of completion menu fields
    fields = {
      'kind',
      'abbr',
      'menu',
    },
  },

  experimental = {
    ghost_text = {
      hl_group = 'GhostText',
    },
  },

})

-- For search forward
cmp.setup.cmdline('/', {
  sources = {
    {
      name = 'buffer',
      option = {
        get_bufnrs = get_bufnrs,
      },
    },
  },
  view = {
    entries = { name = 'wildmenu', separator = ' · ' }
  },
})

-- For search backward
cmp.setup.cmdline('?', {
  sources = {
    {
      name = 'buffer',
      option = {
        get_bufnrs = get_bufnrs,
      },
    },
  },
  view = {
    entries = { name = 'wildmenu', separator = ' · ' }
  },
})

-- For cmdline
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
})
