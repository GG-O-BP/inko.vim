
command! -range Inko call s:Inko(<args>)

function! s:Inko(string)
  exe 'normal! `<v`>"*d'
  let result = substitute(system('inko -' . a:string . ' "' . getreg('*') . '"'), '\n$', '', '')
  if col(".") == col("$")-1
    exe "normal! a" . result . "\<Esc>"
  else
    exe "normal! i" . result . "\<Esc>"
  endif
endfunction

