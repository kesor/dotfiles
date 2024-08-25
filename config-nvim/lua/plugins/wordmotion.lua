-- treat tabs as spaces too
vim.g.wordmotion_spaces = "\t"

-- space before regular vim motion 'c<Space>w' instead of 'cw'
vim.g.wordmotion_prefix = "<Space>"

return {
  "chaoren/vim-wordmotion",
}
