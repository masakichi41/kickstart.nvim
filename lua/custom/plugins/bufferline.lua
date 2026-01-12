return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VeryLazy',
  opts = {
    options = {
      mode = 'buffers',
      separator_style = 'thin',
      show_buffer_close_icons = false,
      show_close_icon = false,
      diagnostics = 'nvim_lsp',
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Explorer',
          highlight = 'Directory',
          separator = true,
        },
      },
    },
  },
  keys = {
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
    { '<leader>x', '<cmd>bdelete<cr>', desc = 'Close buffer' },
    {
      '<leader>x',
      function()
        local bufs = vim.tbl_filter(function(b)
          return vim.bo[b].buflisted
        end, vim.api.nvim_list_bufs())

        if #bufs <= 1 then
          vim.cmd 'terminal'
        end
        vim.cmd 'bdelete! #'
      end,
      desc = 'Close buffer',
    },
  },
}
