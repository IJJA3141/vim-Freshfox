# ❄️🦊 vim-Freshfox

**vim-Freshfox** is a Vim plugin that automates page reloading with Firefox.

Originally, this plugin was ment to be used with vimtex since the it can't refresh the pdf rendered by firefox.
But vim-Freshfox can be used without.

The pluging works by calling an executable who's a compiled ahk script. This script select the Firefox window, refresh it by sending the F5 key and select back the original window.

(it also work with firefox dev)

## 📦 Installation & ⚙️ setup

Just add this repo to your plugin manager.

Using [Lazy](https://github.com/folke/lazy.nvim):
```lua
" Lazy.nvim
{
  "IJJA3141/vim-Freshfox",
}
```
To configure vim-Freshfox to auto reload after [vimtex](https://github.com/lervag/vimtex) autocompiled ad this to your config:
```lua
" Lazy.nvim
{
  "IJJA3141/vim-Freshfox",
  config = function()
    require('vim-Freshfox').setup()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VimtexEventCompileSuccess',
      callback = require('vim-Freshfox').refresh,
      group = vim.api.nvim_create_augroup('vimtex_refresh_firefox', {clear = true})
    })
  end,
}
```
Although I would recomand loading it from an other file like:
```lua
--Lazy.nvim
{
  "IJJA3141/vim-Freshfox",
  config = function()
    require('custom.configs.vim-Freshfox')
  end,
}
```
```lua
--/custom/configs/vim-Freshfox.lua:
local Freshfox = require('vim-Freshfox')

Freshfox.setup({})

vim.api.nvim_create_autocmd('User', {
  pattern = 'VimtexEventCompileSuccess',
  callback = Freshfox.refresh,
  group = vim.api.nvim_create_augroup('vimtex_refresh_firefox', {clear = true})
})
```

## 🚀 Usage

Out of the box, vim-Freshfox provide three function: 
- [FreshfoxRefresh](#-freshfoxrefresh))
- [FreshfoxStart](#-freshfoxstart))
- [FreshfoxStop](#-freshfoxstop))

### 🔃 FreshfoxRefresh

This command doesn't take any parametres,
it simply refresh the browser page.

### ✅ FreshfoxStart

This command will start auto refresh on buffer save.
It accepts file type as parameters
If no parameter is passed to the command vim-Freshfox will reload for every file type.

As an exemple:
```
:Freshfox *.lua text *.tex
```

### 🛑 FreshfoxStop

This command doesn't take any parameters.
It deregister the event to stop the auto refresh
