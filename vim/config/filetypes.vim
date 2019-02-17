" This config includes custom settings for special filetypes

" Markdown / .md
function Markdown()
    set filetype=markdown
endfunction

autocmd BufNewFile,BufReadPost *.Rmd call Markdown()
autocmd BufNewFile,BufReadPost *.rmd call Markdown()
autocmd BufNewFile,BufReadPost *.md call Markdown()

