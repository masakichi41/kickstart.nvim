return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    winopts = {
      height = 0.85,
      width = 0.80,
      preview = {
        layout = 'vertical',
        vertical = 'down:50%',
      },
    },
  },
  keys = {
    { '<leader><leader>', '<cmd>FzfLua buffers<cr>', desc = 'Buffers' },
    { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find files' },
    { '<leader>fr', '<cmd>FzfLua oldfiles<cr>', desc = 'Recent files' },
    { '<leader>sg', '<cmd>FzfLua live_grep<cr>', desc = 'Grep' },
    { '<leader>sw', '<cmd>FzfLua grep_cword<cr>', desc = 'Word under cursor' },
    { '<leader>/', '<cmd>FzfLua lgrep_curbuf<cr>', desc = 'Search in buffer' },
    { '<leader>gc', '<cmd>FzfLua git_commits<cr>', desc = 'Commits' },
    { '<leader>gs', '<cmd>FzfLua git_status<cr>', desc = 'Status' },
    { 'gd', '<cmd>FzfLua lsp_definitions<cr>', desc = 'Definition' },
    { 'gr', '<cmd>FzfLua lsp_references<cr>', desc = 'References' },
    { '<leader>ca', '<cmd>FzfLua lsp_code_actions<cr>', desc = 'Code actions' },
  },
}
