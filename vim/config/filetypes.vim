" This config includes custom settings for special filetypes


" Rmarkdown / .rmd
function Rmarkdown()
    set filetype=markdown
    set conceallevel=0
    let g:markdown_syntax_conceal=0
    let g:markdown_fenced_languages=['r', 'python', 'html', 'sql', 'bash=sh']
endfunction
autocmd BufNewFile,BufReadPost *.Rmd call Rmarkdown()
autocmd BufNewFile,BufReadPost *.rmd call Rmarkdown()

