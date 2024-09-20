return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    vim.keymap.set('n', '<BS>t', ':Neotree toggle show<CR>', map_ops)
    vim.keymap.set('n', '<C-f>', ':Neotree toggle reveal<CR>', map_ops)
    vim.keymap.set('n', '<Leader>tt', ':Neotree focus<CR>', map_ops)
    vim.keymap.set('n', '<Leader>tf', ':Neotree reveal<CR>', map_ops)
    vim.keymap.set('n', '<Leader>tr', function() require("neo-tree.sources.manager").refresh("filesystem") end, map_ops) -- refresh
  end
}
