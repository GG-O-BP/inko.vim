
command! -range Inko call s:Inko(<args>)

function! s:Inko(option)
    let [line_start, coloumn_start] = getpos("'<")[1:2]
    let [line_end, coloumn_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    let lines[-1] = lines[-1][: coloumn_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][coloumn_start - 1:]
    let txtSource = join(lines, "\n")

    let result = substitute(system('inko -' . option . ' "' . txtSource . '"'), '\n$', '', '')

    exe "s/\\%V" . txtSource . "/" . result
endfunction
