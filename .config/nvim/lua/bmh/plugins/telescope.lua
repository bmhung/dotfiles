return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-tree/nvim-web-devicons',
    'folke/todo-comments.nvim',
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        path_display = { 'smart' },
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous, -- move to prev result
            ['<C-j>'] = actions.move_selection_next, -- move to next result
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension('fzf')

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set('n', '<leader>fg', '<cmd>Telescope git_files<cr>', { desc = 'Fuzzy find files tracked by git' })
    keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Fuzzy find files in cwd' })
    keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Fuzzy find recent files' })
    keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', { desc = 'Find string in cwd' })
    keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor in cwd' })

    -- Misc
    keymap.set('n', '<C-b>', ':Telescope buffers<cr>', { desc = "Fuzzy find files in open buffers" })
    keymap.set('n', '<Leader>fb', ':Telescope buffers<cr>', { desc = "Fuzzy find files in open buffers" })
    keymap.set('n', '<Leader>f?', ':Telescope help_tags<cr>')
    keymap.set('n', '<Leader>fh', ':Telescope highlights<cr>')
    keymap.set('n', '<Leader>fc', ':Telescope commands<cr>')
    keymap.set('n', '<Leader>fm', ':Telescope marks<cr>')
    keymap.set('n', '<Leader>fq', ':Telescope quickfix<cr>')
    keymap.set('n', '<Leader>f:', ':Telescope command_history<cr>')
    keymap.set('n', '<Leader>f/', ':Telescope search_history<cr>')
    keymap.set('n', '<Leader>fr', ':Telescope resume<cr>')
    keymap.set('n', '<Leader>ft', ':TodoTelescope<cr>')

  end,
}
