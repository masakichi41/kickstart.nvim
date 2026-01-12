return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Toggle Explorer' },
  },
  opts = {
    open_files_do_not_replace_types = { 'trouble', 'qf' },
    window = {
      position = 'left',
      width = 25,
    },
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = 'open_current',
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        never_show = {
          '.git',
          '.DS_Store',
        },
      },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        local args = vim.fn.argv()
        if #args == 0 then
          vim.cmd 'terminal'
          vim.cmd 'Neotree focus'
        else
          vim.cmd 'Neotree show'
        end
      end,
    })

    vim.api.nvim_create_autocmd('WinClosed', {
      callback = function()
        vim.schedule(function()
          local wins = vim.api.nvim_list_wins()
          if #wins == 1 and vim.bo[vim.api.nvim_win_get_buf(wins[1])].filetype == 'neo-tree' then
            vim.cmd 'quit'
          end
        end)
      end,
    })
  end,
}
