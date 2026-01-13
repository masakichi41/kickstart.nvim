return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  opts = {
    formatters_by_ft = {
      javascript = { 'biome', 'eslint_d', stop_after_first = true },
      typescript = { 'biome', 'eslint_d', stop_after_first = true },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
