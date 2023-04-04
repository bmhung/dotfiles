---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader><leader>"] = { "<C-^>" },
  },
}

-- more keybinds!
M.telescope = {
  plugin = true,
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<C-b>"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
  }
}

M.nvimtree = {
  plugin = true,
  n = {
    ["<C-f>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

return M
