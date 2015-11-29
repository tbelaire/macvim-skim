if !exists("g:macvim_skim_app_path")
    let g:macvim_skim_app_path='/Applications/Skim.app'
endif

if !exists("g:macvim_skim_out_dir")
    let g:macvim_skim_out_dir='.'
endif

if !exists("g:macvim_skim_pdftex_command")
    let g:macvim_skim_pdftex_command='pdflatex -synctex=1 --interaction=nonstopmode -output-directory='.g:macvim_skim_out_dir.' -aux-directory='.g:macvim_skim_out_dir.' %:p'
endif

function! SkimJumpToLine()
    silent execute "!".g:macvim_skim_app_path . "/Contents/SharedSupport/displayline -r "
                \ . line(".") . " %:h/" . g:macvim_skim_out_dir
                \ . "/%:t:r.pdf %"
endfunction

function! CompileTex()
    silent execute "!".g:macvim_skim_pdftex_command
endfunction

" Activate skim
nnoremap <buffer> <localleader>v
    \ :w<CR>
    \ :call SkimJumpToLine() <CR>

nnoremap <buffer> <localleader>p
    \ :w<CR>
    \ :call CompileTex() <CR>
    \ :call SkimJumpToLine() <CR>

nnoremap <buffer> <localleader>m
    \ :w<CR>
    \ !make <CR>
    \ :call SkimJumpToLine() <CR>
" " Reactivate Vim
nnoremap <buffer> <localleader>r
    \ :w<CR>
    \ :call SkimJumpToLine() <CR>
    \ :silent !osascript -e "tell application \"MacVim\" to activate" <CR>

nnoremap <buffer> <localleader>t
    \ :w<CR>
    \ :call CompileTex() <CR>
    \ :call SkimJumpToLine() <CR>
    \ :silent !osascript -e "tell application \"MacVim\" to activate" <CR>


