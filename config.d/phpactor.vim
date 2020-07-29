" Update phpactor
nmap <leader>pu :call phpactor#Update()

" Include use statement
nmap <Leader>pua :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>pmm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>pnn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>po :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>pu :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <Leader>ptt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>pcc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>pee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>pee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>pem :<C-U>call phpactor#ExtractMethod()<CR>


autocmd FileType php setlocal omnifunc=phpactor#Complete
