# vim-Freshfox

vim-Freshfox is a Vim plugin that automates page reloading with Firefox.

Originally, it was ment to be used with vimtex since the pluging can't refresh the pdf if it's rendered with firefox.
But vim-Freshfox can be used without vimtex just by calling the refresh function of the module.

(it also work with firefox dev)

The pluging works by calling an executable who's a compiled ahk script. This script select the Firefox window, refresh it by sending the F5 key and select back the original window.
