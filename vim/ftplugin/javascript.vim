" Display ALE status in Airline
let g:airline#extensions#ale#enabled = 1

" Add ALE as a deoplete source for javascript.
let g:deoplete#sources#javascript = {'_': ['ale']}

let b:ale_linters = ['eslint', 'flow']
let b:ale_fixers = ['eslint']

" Fix files on save.
let g:ale_fix_on_save = 1
