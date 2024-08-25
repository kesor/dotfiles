" Test all Highlights using:
" :runtime syntax/hitest.vim

" ---------------------------------------------------------------------------
" mark vcs conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" set background colors to 'transparent'
hi Normal              guibg=#010203
hi NormalNC            guibg=#010203
hi NormalFloat         guibg=#010203
hi NvimTreeNormal      guibg=#010203
hi NvimTreeNormalNC    guibg=#010203
hi NvimTreeNormalFloat guibg=#010203
hi FzfNormal           guibg=#010203
hi FzfLuaNormal        guibg=#010203
hi FzfLuaPreviewNormal guibg=#010203

