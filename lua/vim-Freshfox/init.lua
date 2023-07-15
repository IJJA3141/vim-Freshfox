local M = {}

M.refresh = function()
  local path = vim.fn.fnamemodify('~', ':p')
  os.execute('start ' .. path .. '/AppData/Local/nvim-data/lazy/vim-Freshfox/vim-Freshfox.exe')
  print('Firefox synced')
end

M.setup = function()
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('Freshfox', { clear = true }),
    callback = M.refresh,
   -- pattern = filetypes,
  })
end

M.vimtex = function ()
  vim.api.nvim_create_autocmd('User', {
    pattern = 'VimtexEventCompileSuccess',
    callback = M.refresh,
    group = vim.api.nvim_create_augroup('vimtex_refresh_firefox', {clear = true})
  })
end

return M
