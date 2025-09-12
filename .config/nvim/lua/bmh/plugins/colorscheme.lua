return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  -- {
  --   'darianmorat/gruvdark.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     vim.cmd.colorscheme('gruvdark')
  --   end,
  -- },
}
