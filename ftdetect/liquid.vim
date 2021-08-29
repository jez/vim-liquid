" Liquid
au BufNewFile,BufRead *.liquid					set ft=liquid

au BufNewFile,BufRead */_layouts/*.html,*/_includes/*.html	set ft=liquid
au BufNewFile,BufRead *.html,*.xml,*.textile
      \ if getline(1) == '---' | set ft=liquid | endif

" I like using vim-pandoc-syntax for Markdown syntax highlighting, so let's
" detect if it's installed and fall back to normal markdown if it's not.
if &runtimepath =~# 'vim-pandoc-syntax'
  let s:markdown = 'pandoc'
else
  let s:markdown = 'markdown'
end

au BufNewFile,BufRead *.markdown,*.mkd,*.mkdn,*.md
      \ if getline(1) == '---' |
      \   let b:liquid_subtype = s:markdown |
      \   set ft=liquid |
      \ endif

" Set subtype for Shopify alternate templates
au BufNewFile,BufRead */templates/**.liquid,*/layout/**.liquid,*/snippets/**.liquid
      \ let b:liquid_subtype = 'html' |
      \ set ft=liquid |
