" General Settings
set expandtab

" NERDCommenter
let g:NERDAltDelims_haskell = 1

"" NecoGHC
let g:haskellmode_completion_ghc = 0
"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"" AutoPairs
let g:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '`':'`'}

"" GHCMod
noremap <silent> <leader>hme :GhcModTypeClear<CR>
noremap <silent> <leader>hmt :GhcModType<CR>
noremap <silent> <leader>hmT :GhcModTypeInsert<CR>
noremap <silent> <leader>hms :GhcModSplitFunCase<CR>
noremap <silent> <leader>hmE :GhcModExpand<CR>
noremap <silent> <leader>hmi :GhcModSigCodegen<CR>

"" haskell-vim
let g:haskell_indent_disable = 1
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_backpack = 1

"" ALE
let g:ale_linters = {'haskell' : ['ghc-mod'] }
