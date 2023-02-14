"" Reload ideavimrc
nnoremap <leader>rr :source ~/.ideavimrc<CR>

"" Terminal
nnoremap <c-t> :action ActivateTerminalToolWindow<CR>
nnoremap <leader>t :action Terminal.OpenInTerminal<CR>

"" Navigation
map <C-e> <Action>(RecentFiles)
nmap <leader>ff <Action>(GotoFile)
nmap <leader>fg <Action>(FindInPath)
nmap <leader>fb <Action>(RecentFiles)
nmap <leader>fu <Action>(FindUsages)
nmap <leader>fn <Action>(NextOccurence)
nmap <leader>fp <Action>(PreviousOccurence)
nmap <leader>e <Action>(GotoNextError)

" new syntax because otherwise Forward does activate after action Back
" new syntax does not allow noremap
nmap gj <Action>(Back)
nmap gk <Action>(Forward)
nmap ge <Action>(JumpToLastChange)
nmap <leader>gd <Action>(GotoDeclaration)
nmap <leader>gs <Action>(FileStructurePopup)
nmap <leader>gu <Action>(FindUsagesMenuGroup)
nmap <leader>ge <Action>(ShowErrorDescription)
nmap <leader>gn <Action>(MethodDown)
nmap <leader>gp <Action>(MethodUp)
nmap <leader>gt <Action>(ShowNavBar)

nmap <leader>uf <Action>(FindUsagesInFile)
nmap <leader>; <Action>(GotoNextElementUnderCaretUsage)
nmap <leader>, <Action>(GotoPrevElementUnderCaretUsage)

nmap <leader>k <Action>(PreviousOccurence)
nmap <leader>j <Action>(NextOccurence)

"" Window management
nmap <leader>ww <Action>(MoveEditorToOppositeTabGroup)
nmap <leader>+ <Action>(StretchSplitToRight)
nmap <leader>- <Action>(StretchSplitToLeft)
nmap <leader>*+ <Action>(StretchSplitToTop)
nmap <leader>*- <Action>(StretchSplitToBottom)

" Editing
nnoremap <C-j> :m +1<CR>
nnoremap <C-k> :m -2<CR>
inoremap <C-j> <Esc>:m +1<CR>gi
inoremap <C-k> <Esc>:m -2<CR>gi
nnoremap <leader>rt :action Refactorings.QuickListPopupAction<CR>
nnoremap <leader>it :action InsertLiveTemplate<CR>
inoremap <A-j> <C-o>:action InsertLiveTemplate<CR>
nnoremap <leader>is :action SurroundWithLiveTemplate<CR>
nnoremap <leader>o :action OptimizeImports<CR>
nnoremap <leader>sc :action StringManipulation.ToCamelCase<CR>

" Run/Debug
map <leader>,r <Action>(ContextRun)
map <leader>,d <Action>(ContextDebug)
map <leader>,u <Action>(Run)
map <leader>,t <Action>(ActivateRunToolWindows)

" VCS
nmap <leader>vv <Action>(Git.Menu)
nmap <leader>vd <Action>(Compare.SameVersion)
nmap <leader>vb <Action>(Git.CompareWithBranch)
nmap <leader>vl <Action>(Vcs.Show.Log)
nmap <leader>vf <Action>(Vcs.ShowTabbedFileHistory)
nmap <leader>va <Action>(Annotate)
nmap <leader>vc <Action>(ActivateCommitToolWindow)
nmap <leader>vu <Action>(Vcs.UpdateProject)
nmap <leader>vn <Action>(VcsShowNextChangeMarker)
nmap <leader>vp <Action>(VcsShowPrevChangeMarker)
nmap <leader>vr <Action>(Vcs.RollbackChangedLines)
