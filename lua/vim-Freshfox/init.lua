local M = {}
local group = 'FreshfoxAutocmd'

M.refresh = function()
  local path = vim.fn.fnamemodify('~', ':p')
  os.execute('start ' .. path .. '/AppData/Local/nvim-data/lazy/vim-Freshfox/vim-Freshfox.exe')
end

M.start = function(opts)
  local pattern = {}

  for arg in opts.args:gmatch('%S+') do
    table.insert(pattern, arg)
    print(arg)
  end

  vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = pattern,
    group = vim.api.nvim_create_augroup(group, { clear = true }),
    callback = M.refresh,
  })
end

M.stop = function()
  vim.api.nvim_del_augroup_by_name(group)
end

M.setup = function()
  vim.api.nvim_create_user_command('FreshfoxStart', M.start, { nargs = '?' })
  vim.api.nvim_create_user_command('FreshfoxStop', M.stop, {})
  vim.api.nvim_create_user_command('FreshfoxRefresh', M.refresh, {})
end

return M
