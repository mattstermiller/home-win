so ~/_vundle
so ~/_commonvimrc

" write swap files here instead of beside each file
set directory=$HOME/.vim/swap//

" command aliases
command! Sorc so $MYVIMRC
command! Sorcvs so ~\_vsvimrc
" fix digitally imported playlist
command! Fixdi %s/\(DI.FM\) - \(.*\)/\2 - \1 Premium/g

let g:wordmotion_prefix = ','

" wrap settings
set textwidth=120
set colorcolumn=+1

" appearance
colorscheme slate
set nu " line numbers
set scrolloff=8
set laststatus=2 " airline always on
syntax on

" syntax filetype associations
au BufNewFile,BufRead *.nuspec setlocal ft=xml
au BufNewFile,BufRead *.cls setlocal ft=vb

" toggle expandtab
function ToggleTab()
    if &expandtab
        set noexpandtab
        echo "indenting with tabs"
    else
        set expandtab
        echo "indenting with spaces"
    endif
endfunction
nnoremap <F9> mz:execute ToggleTab()<cr>`z

" show/hide whitespace chars
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
function ToggleWhiteSpace()
    if &list
        set nolist
        echo "not showing whitespace"
    else
        set list
        echo "showing whitespace"
    endif
endfunction
nnoremap <F10> mz:execute ToggleWhiteSpace()<cr>`z

" turn off automatic text wrapping
nnoremap <F11> :set fo-=t<cr>
