" Aether colorscheme for Vim/Neovim - Base16 color scheme
" Maintainer: Bjarne Øverli
" License: MIT

" Neovim-only Lua colorscheme
if !has('nvim')
  echohl ErrorMsg
  echom "aether.nvim requires Neovim"
  echohl None
  finish
endif

lua require('aether').setup()