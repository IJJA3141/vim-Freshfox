local M = {}

M.refresh = function()
  local path = vim.fn.fnamemodify('~', ':p')
  os.execute('start '.. path .. '/AppData/Local/nvim-data/lazy/vim-Freshfox/vim-Freshfox.exe')
end

return M
